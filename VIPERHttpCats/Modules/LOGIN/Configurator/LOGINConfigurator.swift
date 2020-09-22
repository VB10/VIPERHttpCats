//
//  LOGINLOGINConfigurator.swift
//  VIPERHttpCats
//
//  Created by VB on 22/09/2020.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class LOGINModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LOGINViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LOGINViewController) {

        let router = LOGINRouter()

        let presenter = LOGINPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LOGINInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
