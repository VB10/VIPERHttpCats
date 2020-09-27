//
//  Cat.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation

struct Cat: Codable {
    let catDescription: String
    let imageURL: String
    let statusCode: Int

    enum CodingKeys: String, CodingKey {
        case catDescription = "description"
        case imageURL = "imageUrl"
        case statusCode
    }
}


struct CatRepositoresResponse: Codable {
    let items: [Cat]
}

