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


class HomeRouter {

    var viewController: HomeViewController

    init(view: HomeViewController) {
        self.viewController = view
    }

}

extension HomeRouter: HomeRouting {
    func navigateLogin() {
        self.viewController.present(CatViewController(), animated: true)
    }
}
