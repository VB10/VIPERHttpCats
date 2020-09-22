//
//  CatListInterector.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class CatsListInteractor: PresenterToInterectorCatListProtocol {
  
    

    var presenter: InteractorToPresenterPostsListProtocol?
    var catService: CatService?


    func loadCats() {
        guard let service = catService else { return }

        service.getPosts { (cats, error) in
            if let list = cats {
                self.presenter?.catsSucces(cats: list)
            } else {
                self.presenter?.postFailed()
            }

        }
    }

}
