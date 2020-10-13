//
//  HomePresentation.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


typealias HomePresenterDependencies = (
    interactor: HomeInteractor,
    router: HomeRouterOutput
)

class HomePresenter {

    var view: HomeViewInputs?
    internal var entites: HomeEntities
    let dependencies: HomePresenterDependencies


    init(view: HomeViewInputs,
        entites: HomeEntities,
        dependencies: HomePresenterDependencies) {
        self.view = view
        self.entites = entites
        self.dependencies = dependencies
    }
}

extension HomePresenter: HomeViewOutputs {
    func viewDidLoad() {
        view?.configure(entities: HomeEntities(entryEntity: HomeEntryEntity(language: "vb")))
        entites.catApiState = .loading
        view?.indicatorView(animate: true)
        dependencies.interactor.fetchCats()
        view?.setupTableViewCell()
    }

    func onCloseButtonTapped() {
        dependencies.router.dismiss(animated: true)
    }

    func onReachBottom() {
        guard entites.catApiState != .loading else {
            return
        }
        entites.catApiState = .loading
        dependencies.interactor.fetchCats()
        view?.indicatorView(animate: true)
    }

}

extension HomePresenter: HomeTableViewDataSourceOutputs {
    func didSelect(_ cat: Cat) {
        dependencies.router.navigateToDetail(httpCat: cat)
    }
}

extension HomePresenter: HomeInteractorOutputs {

    func onSuccessSearch(res: CatRepositoresResponse) {
        entites.catApiState = .complete
        entites.catRepositories = res.items
        view?.reloadTableView(tableViewDataSource: HomeTableViewDataSoruce(entities: entites, presenter: self))
        view?.indicatorView(animate: false)
    }

    func onErrorSearch(error: BaseError) {
        view?.indicatorView(animate: false)
    }
}
