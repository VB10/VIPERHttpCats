//
//  HomeInteractor.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

protocol HomeInteractorOutputs {
    func onSuccessSearch(res: CatRepositoresResponse)
    func onErrorSearch(error: BaseError)
}
class HomeInteractor: Interactorable {

    var presenter: HomeInteractorOutputs?
    var networkManager: INetworkService

    init(networkManager: INetworkService) {
        self.networkManager = networkManager
    }


    func fetchCats() {
        networkManager.get(path: .firebase, nil, onSuccess: { (response: BaseResponse<[Cat]>) in
            guard let data = response.model else {
//                self.presenter?.onErrorSearch(error: )
                return
            }

            self.presenter?.onSuccessSearch(res: CatRepositoresResponse(items: data))
        }) { (error) in
        
            self.presenter?.onErrorSearch(error: error)
        }

    }
}
