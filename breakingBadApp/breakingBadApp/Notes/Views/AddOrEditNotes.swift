//
//  AddOrEditNotes.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 1.12.2022.
//

import UIKit

protocol AddOrEditNotesDelegate: AnyObject {
    func savePressed(input: String,index: Int,noteType: NoteType)
    func refreshNotes()
}


class AddOrEditNotes: UIView {
    
    @IBOutlet weak var saveButton: UIButton!
    private var note: Note!
    @IBOutlet private weak var noteTextView: UITextView!
    weak var delegate: AddOrEditNotesDelegate?
    private var index: Int = 0
    private var noteType: NoteType? = .save
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        customInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        customInit()
    }
    
    private func customInit() {
        let nib = UINib(nibName: "AddOrEditNotes", bundle: nil)
        if let view = nib.instantiate(withOwner: self).first as?
            UIView {
            addSubview(view)
            view.frame = self.bounds
        }
    }
    
    func setup(index: Int, note: Note, noteType: NoteType? = .save) {
        self.index = index
        self.note = note
        self.noteType = noteType
        self.noteTextView.text = note.noteText
        self.saveButton.setTitle(noteType == .save ? "SAVE" : "EDIT", for: .normal)
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        delegate?.savePressed(input: noteTextView.text,index: index, noteType: noteType ?? .save)
        removeFromSuperview()
    }
}

enum NoteType {
    case save,edit
}
