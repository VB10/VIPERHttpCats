//
//  CatListPresenter.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class CatListPresenter: ViewToPreeneterCatListProtocol {
    var view: PresenterToViewCatListProtocol?


    var interactor: PresenterToInterectorCatListProtocol?
    var router: PresenterToRouterCatListProtocol?

    func fetchPost() {
//        interactor?.loadPost()
    }
}


extension CatListPresenter: InteractorToPresenterPostsListProtocol {
    func catsSucces(cats: [Cat]) {
        view?.onPostResponseSuccess(catList: cats)
    }

    func postFailed() {
        view?.onPostResponseFailed(error: NSError())
    }

}
