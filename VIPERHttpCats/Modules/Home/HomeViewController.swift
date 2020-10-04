//
//  HomeViewController.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

protocol HomeViewInputs {
    func configure(entities: HomeEntities)
    func reloadTableView(tableViewDataSource: HomeTableViewDataSoruce)
    func setupTableViewCell()
    func indicatorView(animate: Bool)
}

protocol HomeViewOutputs {
    func viewDidLoad()
    func onCloseButtonTapped()
    func onReachBottom()
}

class HomeViewController: UIViewController {

    var presenter: HomePresenter?
    internal var tableViewDataSource: TableViewItemDataSource?
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var homeTableViewController: UITableView! {
        didSet {
            homeTableViewController.delegate = self
            homeTableViewController.dataSource = self
        }
    }
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
//        presenter?.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func navigateCats(_ sender: Any) {
//        presenter?.navigateLogin()
    }

}



extension HomeViewController: Viewable { }


extension HomeViewController: HomeViewInputs {
    func setupTableViewCell() {
        let nib = UINib(nibName: "CatTableViewCell", bundle: nil)
        self.homeTableViewController.register(nib, forCellReuseIdentifier: "CatTableViewCell")
    }

    func configure(entities: HomeEntities) {
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.titleLabel.text = entities.entryEntity.language

    }

    func reloadTableView(tableViewDataSource: HomeTableViewDataSoruce) {
        self.tableViewDataSource = tableViewDataSource

        DispatchQueue.main.async {
            self.homeTableViewController.reloadData()
        }
    }

    func indicatorView(animate: Bool) {
        DispatchQueue.main.async {
            self.homeTableViewController.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: animate ? 50 : 0, right: 0)

            _ = animate ? self.activityIndicator.startAnimating() : self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = !animate

        }
    }


}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource?.numberOfItems ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewDataSource?.itemCell(tableView: tableView, indexPath: indexPath) ?? UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("a")
        tableViewDataSource?.didSelect(tableView: tableView, indexPath: indexPath)
    }

//    didselec
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleLastIndexPath = homeTableViewController.visibleCells.compactMap { [weak self] in
            self?.homeTableViewController.indexPath(for: $0)
        }.last
        guard let last = visibleLastIndexPath, last.row > (tableViewDataSource?.numberOfItems ?? 0) - 2 else { return }
        presenter?.onReachBottom()
    }


}
