//
//  EpisodeDetailsTableViewCell.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit

class EpisodeDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var performerLabel: UILabel!
    
    func setup(model: [String], atIndex: Int) {
        performerLabel.text = model[atIndex]
    }
    
}
