//
//  NetworkManager.swift
//  VIPERHttpCats
//
//  Created by Veli on 27.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


import Foundation
import Alamofire


typealias Success<T : Codable> = (BaseResponse<T>) -> Void
typealias Error = (BaseError) -> Void


class NetworkManager: INetworkService {
    private var baseUrl: String

    init(config: NetworkConfig) {
        self.baseUrl = config.baseUrl
    }

    func get<T: Codable>(
        path: NetworkPath,
        _ paramaters: [String: String]?,
        onSuccess: @escaping Success<T>,
        onError: @escaping Error
    ) {
        AF.request(networkRequestUrl(path),
            method: .get,
            parameters: paramaters
        ).validate().responseDecodable(of: T.self)
        { (response) in
            guard let model = response.value else {
                onError(BaseError(response.error))
                return
            }

            onSuccess(BaseResponse.init(model: model, message: ""))

        }
    }

}

extension NetworkManager {
    func networkRequestUrl(_ path: NetworkPath) -> String {
        return baseUrl + "/" + path.rawValue
    }
}
