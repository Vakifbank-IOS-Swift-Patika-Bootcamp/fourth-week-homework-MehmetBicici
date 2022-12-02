//
//  NotesViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 1.12.2022.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet private weak var notesTableView: UITableView!
    private var notes: [Note] = []
    private let floatingButton: UIButton = {
        let button = UIButton(frame:CGRect(x: 0, y: 0, width: 60, height: 60))
        button.backgroundColor = .black
        let image = UIImage(systemName: "plus", withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .medium))
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.3
        button.layer.cornerRadius = 30
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        notes = CoreDataManager.shared.getNotes()
        view.addSubview(floatingButton)
        floatingButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        configureTableView()
    }
    
    private func configureTableView() {
        notesTableView.delegate = self
        notesTableView.dataSource = self
        notesTableView.register(UINib(nibName: "NoteTableViewCell", bundle: nil), forCellReuseIdentifier: "NoteCell")
        notesTableView.estimatedRowHeight = UITableView.automaticDimension
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        floatingButton.frame = CGRect(x: view.frame.size.width - 80, y: view.frame.size.height - 120, width: 60, height: 60)
    }
    
    @objc private func didTapButton() {
        let addOrEditNotesView = AddOrEditNotes(frame: CGRect(origin: CGPoint(x: view.center.x - 100, y: view.center.y - 100), size: CGSize(width: 200, height: 300)))
        addOrEditNotesView.alpha = 0
        UIView.animate(withDuration: 2.0) {
            addOrEditNotesView.alpha = 1
        }
        addOrEditNotesView.delegate = self
        view.addSubview(addOrEditNotesView)
    }
}

extension NotesViewController: AddOrEditNotesDelegate {
    func refreshNotes() {
        notesTableView.reloadData()
    }
    
    func savePressed(input: String, index: Int, noteType type: NoteType) {
        if (type == .save) {
            notes.append(CoreDataManager.shared.saveNote(text: input)!)
        } else {
            let note = notes[index]
            note.noteText = input
            notes.append(CoreDataManager.shared.saveNote(text: "")!)
            notes.remove(at: notes.count - 1)
            
        }
        floatingButton.isHidden = false
        notesTableView.reloadData()
    }
}

extension NotesViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell", for: indexPath) as? NoteTableViewCell else { return UITableViewCell() }
        cell.setup(model: notes[indexPath.row])
        if notes[indexPath.row].noteText == "" {
            notes.remove(at: indexPath.row)
            notesTableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataManager.shared.deleteNote(note: notes[indexPath.row])
            notes.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let addOrEditNotesView = AddOrEditNotes(frame: CGRect(origin: CGPoint(x: view.center.x - 100, y: view.center.y - 100), size: CGSize(width: 200, height: 300)))
        addOrEditNotesView.delegate = self
        view.addSubview(addOrEditNotesView)
        addOrEditNotesView.setup(index: indexPath.row,note: notes[indexPath.row], noteType: .edit)
        floatingButton.isHidden = true
        notesTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
}

