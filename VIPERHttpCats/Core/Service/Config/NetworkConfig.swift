//
//  NetworkConfig.swift
//  HepsiBuradaSearch
//
//  Created by Veli on 11.07.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


class NetworkConfig {
    var baseUrl: String
    var headers: [String: String]?

    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
}
