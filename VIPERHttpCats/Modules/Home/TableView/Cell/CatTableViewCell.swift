//
//  CatTableViewCell.swift
//  VIPERHttpCats
//
//  Created by Veli on 30.09.2020.
//  Copyright © 2020 Veli. All rights reserved.
//

import UIKit
import Kingfisher
class CatTableViewCell: UITableViewCell {

    @IBOutlet weak var catImageView: UIImageView!
    @IBOutlet weak var catStatusLabel: UILabel!
    @IBOutlet weak var catStatusCodeLabel: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

    }

    func setupCell(catModel: Cat?) {
        guard let cat = catModel else { return }

        catImageView.kf.setImage(with: cat.imageURL.getUrl())
        catStatusLabel.text = cat.catDescription
        catStatusCodeLabel.text = String(cat.statusCode)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
