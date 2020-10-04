//
//  DetailEntitties.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
struct DetailEntity {
    let title: String
    let heroKey: String
}

final class DetailEntites {

    var catItem: Cat?
    var detailEntry: DetailEntity?


    init(entryEntity: DetailEntity) {
        self.detailEntry = entryEntity
    }
}
