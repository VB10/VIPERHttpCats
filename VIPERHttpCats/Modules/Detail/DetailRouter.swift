//
//  DetailRouter.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import UIKit

final class DetailRouter {

    var viewController: DetailViewController

    init(viewController: DetailViewController) {
        self.viewController = viewController
    }
}


struct DetailRouterInput {

    func view(detailEntity: DetailEntites) -> DetailViewController {

        let view = DetailViewController()
        let interactor = DetailInteractor()
        let dependicies = DeatilPresenterDependecies(
            interactor: interactor,
            router: DetailRouterOutput(view)
        )
        let presenter = DetailPresenter(view: view, entities: detailEntity, dependecies: dependicies)
        view.presenter = presenter
        return view
    }

    func push(from: Viewable, entryEntity: DetailEntites) {
        let view = self.view(detailEntity: entryEntity)
        from.push(view, animated: true)
    }
    
    
    func present(from: Viewable, entryEntity: DetailEntites) {
        let nav = UINavigationController(rootViewController: view(detailEntity: entryEntity))
         from.present(nav, animated: true)
     }

}


final class DetailRouterOutput: Routerable {

    private(set) weak var view: Viewable!

    init(_ view: Viewable) {
        self.view = view
    }

}
