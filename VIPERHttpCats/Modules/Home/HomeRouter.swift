//
//  HomeRouter.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit


protocol HomeRouting {
    func navigateLogin()
}



final class HomeRouter {

    var viewController: HomeViewController

    init(view: HomeViewController) {
        self.viewController = view
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

    func transitionDetail(httpCat: Cat) {
//
        print(httpCat.catDescription)
    }
}
