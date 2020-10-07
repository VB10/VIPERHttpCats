//
//  HomeContractor.swift
//  VIPERHttpCats
//
//  Created by Veli on 7.10.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

protocol HomeViewInputs {
    func configure(entities: HomeEntities)
    func reloadTableView(tableViewDataSource: HomeTableViewDataSoruce)
    func setupTableViewCell()
    func indicatorView(animate: Bool)
    func sortByTitle()
}

protocol HomeViewOutputs {
    func viewDidLoad()
    func onCloseButtonTapped()
    func onReachBottom()
}
