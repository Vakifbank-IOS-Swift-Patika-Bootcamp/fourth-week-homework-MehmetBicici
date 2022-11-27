//
//  QuotesTableViewCell.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit

class QuotesTableViewCell: UITableViewCell {

    @IBOutlet private weak var quotesLabel: UILabel!

    func setup(model: QuotesModel) {
        quotesLabel.text = model.quote
        quotesLabel.sizeToFit()
    }
}
