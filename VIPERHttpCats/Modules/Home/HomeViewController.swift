//
//  HomeViewController.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

protocol HomeView: class {
    func updateTitle(title: String) -> (Void)
}

class HomeViewController: UIViewController {

    var presenter: HomePresentation?
    @IBOutlet weak var titleLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    @IBAction func navigateCats(_ sender: Any) {
        presenter?.navigateLogin()
    }

}


extension HomeViewController: HomeView {
    func updateTitle(title: String) {
        self.titleLabel.text = title
    }
}


extension HomeViewController: Viewable { }
