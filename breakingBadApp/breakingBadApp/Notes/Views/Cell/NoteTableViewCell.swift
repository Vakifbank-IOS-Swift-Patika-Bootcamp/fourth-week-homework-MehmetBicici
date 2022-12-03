//
//  NoteTableViewCell.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 1.12.2022.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var noteLabel: UILabel!
    
    func setup(model: Note) {
        noteLabel.text = model.noteText
    }
}
