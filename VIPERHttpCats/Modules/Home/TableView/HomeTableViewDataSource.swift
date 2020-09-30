//
//  HomeTableViewDataSource.swift
//  VIPERHttpCats
//
//  Created by Veli on 27.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import UIKit

protocol HomeTableViewDataSourceOutputs: AnyObject {
    func didSelect(_ cat: Cat)
}

class HomeTableViewDataSoruce: TableViewItemDataSource {

    private var entities: HomeEntities!
    private weak var presenter: HomeTableViewDataSourceOutputs?


    init(entities: HomeEntities!, presenter: HomeTableViewDataSourceOutputs) {
        self.entities = entities
        self.presenter = presenter
    }
    var numberOfItems: Int {
        return entities.catRepositories.count
    }

    func itemCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {


        guard let catCell = tableView.dequeueReusableCell(withIdentifier: "CatTableViewCell") as? CatTableViewCell else { return UITableViewCell() }

        catCell.setupCell(catModel: entities.catRepositories[indexPath.row])

//        let cat = entities.catRepositories[indexPath.row]
//        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "subtitle")
//        cell.textLabel?.text = cat.catDescription
//        cell.detailTextLabel?.text = "\(cat.statusCode)"

        return catCell
    }


    func didSelect(tableView: UITableView, indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let selectedCat = entities.catRepositories[indexPath.row]
        presenter?.didSelect(selectedCat)
    }


}
