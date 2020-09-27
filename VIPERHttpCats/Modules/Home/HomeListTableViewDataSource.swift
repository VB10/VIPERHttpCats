//
//  HomeListTableViewDataSource.swift
//  VIPERHttpCats
//
//  Created by Veli on 23.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import UIKit


protocol ListTableViewDataSourceOutputs: AnyObject {
    func didSelect(_ gitHubRepository: Cat)
}
protocol TableViewItemDataSource: AnyObject {
    var numberOfItems: Int { get }

    func itemCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
    func didSelect(tableView: UITableView, indexPath: IndexPath)
}

final class ListTableViewDataSource: TableViewItemDataSource {

    private weak var entities: HomeEntities!
    private weak var presenter: ListTableViewDataSourceOutputs?

    init(entities: HomeEntities, presenter: ListTableViewDataSourceOutputs) {
        self.entities = entities
        self.presenter = presenter
    }

    var numberOfItems: Int {
        return entities.catRepositories.count
    }

    func itemCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {

        let repo = entities.catRepositories[indexPath.row]
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "subtitle")
        cell.textLabel?.text = "\(repo.catDescription)"
        cell.detailTextLabel?.textColor = UIColor.lightGray
        cell.detailTextLabel?.text = "\(repo.statusCode)"
        return cell
    }

    func didSelect(tableView: UITableView, indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedRepo = entities.catRepositories[indexPath.row]
        presenter?.didSelect(selectedRepo)
    }

}
