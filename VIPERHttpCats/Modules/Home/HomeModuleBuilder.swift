//
//  HomeModuleBuilder.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit


class HomeModuleBuilder {
    func build() -> UIViewController {
        let homeViewController = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(view: homeViewController)
        homeViewController.presenter = HomePresenter(view: homeViewController, interactor: interactor, router: router)
        return homeViewController
    }
}
