//
//  HomeViewController.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit



class HomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var homeTableViewController: UITableView! {
        didSet {
            homeTableViewController.delegate = self
            homeTableViewController.dataSource = self
        }
    }

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!

    var presenter: HomePresenter?
    internal var tableViewDataSource: TableViewItemDataSource?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    @IBAction func filterButtonPressed(_ sender: Any) {
        sortByTitle()
    }

}

extension HomeViewController: Viewable { }


extension HomeViewController: HomeViewInputs {
    func sortByTitle() {
        tableViewDataSource?.sortItems(tableView: homeTableViewController)
    }

    func setupTableViewCell() {
        let nib = UINib(nibName: "CatTableViewCell", bundle: nil)
        self.homeTableViewController.register(nib, forCellReuseIdentifier: "CatTableViewCell")
    }

    func configure(entities: HomeEntities) {
        self.navigationItem.title = entities.entryEntity.language
        self.titleLabel.text = ""
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
        tableViewDataSource?.didSelect(tableView: tableView, indexPath: indexPath)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let visibleLastIndexPath = homeTableViewController.visibleCells.compactMap { [weak self] in
            self?.homeTableViewController.indexPath(for: $0)
        }.last
        guard let last = visibleLastIndexPath, last.row > (tableViewDataSource?.numberOfItems ?? 0) - 2 else { return }
        presenter?.onReachBottom()
    }
}
