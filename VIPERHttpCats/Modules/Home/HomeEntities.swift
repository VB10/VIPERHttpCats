//
//  HomeEntities.swift
//  VIPERHttpCats
//
//  Created by Veli on 23.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

struct HomeEntryEntity {
    let language: String
}

final class HomeEntities {

    let entryEntity: HomeEntryEntity
    var catRepositories: [Cat] = []

    enum CatApiState {
        case loading
        case complete
    }

    var catApiState = CatApiState.complete


    init(entryEntity: HomeEntryEntity) {
        self.entryEntity = entryEntity
    }
}
