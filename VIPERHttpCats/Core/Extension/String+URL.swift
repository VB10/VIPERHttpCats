//
//  String+URL.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import Foundation


extension String {

    func getUrl() -> URL? {
        return URL(string: self)
    }
}
