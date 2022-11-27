//
//  AllCharsCollectionViewCell.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import UIKit
import Kingfisher

class AllCharsCollectionViewCell: UICollectionViewCell {

    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    
    func setup(model: ListOfAllCharsModel) {
        let imageUrl = URL(string: model.img)
        thumbnailImageView.kf.setImage(with: imageUrl)
        birthdayLabel.text = model.birthday
        nameLabel.text = model.name
        nicknameLabel.text = model.nickname
    }

}
