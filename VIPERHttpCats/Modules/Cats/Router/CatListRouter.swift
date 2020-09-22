//
//  CatListRouter.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

class CatListRouter: PresenterToRouterCatListProtocol {
    func createCatListModule(catListReference: CatViewController) {

        let presenter: ViewToPreeneterCatListProtocol & InteractorToPresenterPostsListProtocol = CatListPresenter()
        
        catListReference.catPresenter = presenter
        
        catListReference.catPresenter?.router = CatListRouter()
        catListReference.catPresenter?.interactor = CatsListInteractor()
        
//        catListReference.catPresenter?.view = catListReference


    }



}
