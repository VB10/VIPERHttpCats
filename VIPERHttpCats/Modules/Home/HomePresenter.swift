//
//  HomePresentation.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


protocol HomePresentation {
    func viewDidLoad()
    func navigateLogin()
}

class HomePresenter {

    weak var view: HomeView?
    var interactor: HomeUseCase
    var router: HomeRouting

    init(view: HomeView, interactor: HomeUseCase, router: HomeRouting) {
        self.interactor = interactor
        self.router = router
        self.view = view
    }

}


extension HomePresenter: HomePresentation {
    func navigateLogin() {
        router.navigateLogin()
    }

    func viewDidLoad() {
        print(self.interactor.getTitle())

        view?.updateTitle(title: self.interactor.getTitle())
    }
}
