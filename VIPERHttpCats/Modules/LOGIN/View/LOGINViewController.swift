//
//  LOGINLOGINViewController.swift
//  VIPERHttpCats
//
//  Created by VB on 22/09/2020.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class LOGINViewController: UIViewController, LOGINViewInput {

    var output: LOGINViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: LOGINViewInput
    func setupInitialState() {
    }
}
