//
//  BaseResponse.swift
//  HepsiBuradaSearch
//
//  Created by Veli on 11.07.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


struct BaseResponse<T : Codable> {
    var model: T?
    var message: String?
}
