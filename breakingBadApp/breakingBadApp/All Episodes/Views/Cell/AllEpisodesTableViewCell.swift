//
//  AllEpisodesTableViewCell.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit

class AllEpisodesTableViewCell: UITableViewCell {

    @IBOutlet private weak var seasonLabel: UILabel!
    @IBOutlet private weak var episodeLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func setup(model: ListOfAllEpisodesModel) {
        seasonLabel.text = "Season: \(model.season)"
        episodeLabel.text = "Episode: \(model.episode)"
        titleLabel.text = "Title: \(model.title)"
        titleLabel.sizeToFit()
    }
    
}
