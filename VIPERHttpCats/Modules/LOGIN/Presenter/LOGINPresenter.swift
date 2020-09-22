//
//  LOGINLOGINPresenter.swift
//  VIPERHttpCats
//
//  Created by VB on 22/09/2020.
//  Copyright © 2020 VB. All rights reserved.
//

class LOGINPresenter: LOGINModuleInput, LOGINViewOutput, LOGINInteractorOutput {

    weak var view: LOGINViewInput!
    var interactor: LOGINInteractorInput!
    var router: LOGINRouterInput!

    func viewIsReady() {

    }
}
