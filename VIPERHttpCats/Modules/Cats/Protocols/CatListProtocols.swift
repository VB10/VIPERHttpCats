//
//  CatListProtocols.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


protocol ViewToPreeneterCatListProtocol {

    var view: PresenterToViewCatListProtocol? { get set }
    var interactor: PresenterToInterectorCatListProtocol? { get set }

    var router: PresenterToRouterCatListProtocol? { get set }

    func fetchPost()

}


protocol PresenterToViewCatListProtocol {

    func onPostResponseSuccess(catList: [Cat])
    func onPostResponseFailed(error: Error)
}


protocol PresenterToRouterCatListProtocol {
    func createCatListModule(catListReference: CatViewController)
}


protocol PresenterToInterectorCatListProtocol {

    var presenter: InteractorToPresenterPostsListProtocol? { get set }

    func loadCats()
}

protocol InteractorToPresenterPostsListProtocol {
    func catsSucces(cats: [Cat])
    func postFailed()

}
