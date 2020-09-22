//
//  CatService.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation
import Alamofire


class CatService {

    func getPosts(completionHandler: @escaping ([Cat]?, Error?) -> Void) {
        let url = "https://jsonplaceholder.typicode.com/posts?userId=1"


        AF.request(url, method: HTTPMethod.get, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in

            guard let response = response.data else {
                completionHandler(nil, MachError(.failure))
                return
            }

            let cats = try! JSONDecoder().decode([Cat].self, from: response)

            completionHandler(cats, nil)
        }
        )
    }
}
