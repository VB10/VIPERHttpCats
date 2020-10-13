//
//  HomeRouter.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit



final class HomeRouter {

    let navigationController: UINavigationController

    var viewController: HomeViewController

    init(view: HomeViewController) {
        self.viewController = view
        navigationController = UINavigationController(rootViewController: view)
    }

}

struct HomeRouterInput {
    private func view(entryEntity: HomeEntryEntity) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor(networkManager: NetworkManager(config: NetworkConfig(baseUrl: ApplicatonConstants.BASE_URL)))

        let dependecies = HomePresenterDependencies(
            interactor: interactor,
            router: HomeRouterOutput(view)
        )

        let presenter = HomePresenter(view: view, entites: HomeEntities(entryEntity: entryEntity), dependencies: dependecies)

        view.presenter = presenter
        view.tableViewDataSource = HomeTableViewDataSoruce(entities: presenter.entites, presenter: presenter)
        interactor.presenter = presenter
        return view
    }

    func open(from: Viewable, entryEntity: HomeEntryEntity) -> HomeViewController {
        return self.view(entryEntity: entryEntity)
    }
}

final class HomeRouterOutput: Routerable {

    private(set) weak var view: Viewable!
    init(_ view: Viewable) {
        self.view = view
    }

    func navigateToDetail(httpCat: Cat) {
        let detailEntitites = DetailEntites(entryEntity: DetailEntity(title: "Detail", heroKey: "hero"))
        detailEntitites.catItem = httpCat
        DetailRouterInput().push(from: view, entryEntity: detailEntitites)
    }
}
