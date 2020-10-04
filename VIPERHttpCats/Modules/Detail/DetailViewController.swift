//
//  DetailViewController.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit

protocol DetailViewInputs {
    func configure(entities: DetailEntites)

}

protocol DetailViewOutputs {
    func viewDidLoad()
    func onBackButton()
}


class DetailViewController: UIViewController {
    internal var presenter: DetailViewOutputs?

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var statusCodeLabel: UILabel!
    @IBOutlet weak var statusCodeDescription: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()

    }
}



extension DetailViewController: Viewable { }

extension DetailViewController: DetailViewInputs {
    func configure(entities: DetailEntites) {

        guard let cat = entities.catItem else { return }
        imageView.kf.setImage(with: cat.imageURL.getUrl())
        statusCodeLabel.text = String(cat.statusCode)
        statusCodeDescription.text = cat.catDescription
    }

}

