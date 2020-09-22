//
//  HomeInteractor.swift
//  VIPERHttpCats
//
//  Created by Veli on 22.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

//https://www.youtube.com/watch?v=7wrhpBXtDJ8

protocol HomeUseCase {
    func getTitle() -> String
}

class HomeInteractor { }


extension HomeInteractor: HomeUseCase {
    func getTitle() -> String {
        return "VB"
    }
}
