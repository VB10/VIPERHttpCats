//
//  INetworkManager.swift
//  HepsiBuradaSearch
//
//  Created by Veli on 11.07.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


protocol INetworkService {
    func get<T : Codable>(path: NetworkPath, _ paramaters: [String: String]?, onSuccess: @escaping (BaseResponse<T>) -> Void, onError: @escaping (BaseError) -> Void)
}
