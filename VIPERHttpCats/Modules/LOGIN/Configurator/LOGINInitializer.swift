//
//  LOGINLOGINInitializer.swift
//  VIPERHttpCats
//
//  Created by VB on 22/09/2020.
//  Copyright © 2020 VB. All rights reserved.
//

import UIKit

class LOGINModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var loginViewController: LOGINViewController!

    override func awakeFromNib() {

        let configurator = LOGINModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: loginViewController)
    }

}
