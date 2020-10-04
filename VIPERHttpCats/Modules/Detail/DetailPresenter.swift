//
//  DetailPresenter.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


typealias DeatilPresenterDependecies = (
    interactor: DetailInteractor,
    router: DetailRouterOutput
)

class DetailPresenter {

    var view: DetailViewInputs?
    internal var entities: DetailEntites
    let dependecies: DeatilPresenterDependecies


    init(view: DetailViewInputs, entities: DetailEntites, dependecies: DeatilPresenterDependecies) {
        self.view = view
        self.entities = entities
        self.dependecies = dependecies
    }
}



extension DetailPresenter: DetailViewOutputs {
    func viewDidLoad() {
        view?.configure(entities: entities)

    }

    func onBackButton() {
        dependecies.router.dismiss(animated: true)
    }


}
