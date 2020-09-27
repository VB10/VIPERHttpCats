//
//  BaseError.swift
//  HepsiBuradaSearch
//
//  Created by Veli on 11.07.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import Alamofire

class BaseError {
    var errorMessage: String?
    var statusCode: Int?
    var debugMessage: String?
    
    init(_ afError : AFError?) {
        debugMessage = afError.debugDescription
        statusCode = afError?.responseCode
        errorMessage = afError?.errorDescription
    }
}



