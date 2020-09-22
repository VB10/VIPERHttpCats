//
//  CatViewController.swift
//  VIPERHttpCats
//
//  Created by Veli on 20.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

//https://medium.com/flawless-app-stories/implementing-viper-archticture-pattern-for-ios-d24a6def8ba2 @yusuf
class CatViewController: UIViewController {

    var catList: [Cat] = []
    var catPresenter: ViewToPreeneterCatListProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
