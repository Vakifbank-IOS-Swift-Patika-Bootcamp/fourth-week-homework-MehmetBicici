//
//  CharDetailsViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit
import Kingfisher

class CharDetailsViewController: BaseViewController {
    
    private var viewModel = CharDetailsViewModel()
    private var emptyData: [CharDetailsModels]?
    private var nameData = String()
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet private weak var charImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var nicknameLabel: UILabel!
    @IBOutlet private weak var birthdayLabel: UILabel!
    @IBOutlet private weak var portrayedLabel: UILabel!
    @IBOutlet weak var designImageView: UIImageView!
    
    override func viewWillAppear(_ animated: Bool) {
        indicator.startAnimating()
        viewModel.getData {
            self.emptyData = self.viewModel.setData()
            self.nameLabel.text = "Character Name: \(self.viewModel.getName(data: self.emptyData ?? []))"
            self.charImageView.kf.setImage(with: self.viewModel.getImage(data: self.emptyData ?? []))
            self.nicknameLabel.text = "Character Nickname: \(self.viewModel.getNickname(data: self.emptyData ?? []))"
            self.birthdayLabel.text = "Birth Date: \(self.viewModel.getBirthday(data: self.emptyData ?? []))"
            self.portrayedLabel.text = "Real Name: \(self.viewModel.getPortrayed(data: self.emptyData ?? []))"
            self.designImageView.image = self.viewModel.addImageForDetail()
            self.nameData = self.viewModel.getName(data: self.emptyData ?? [])
            self.indicator.stopAnimating()
            self.showAlertForCharDetails()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func setId(id: Int?) {
        guard let id = id else { return }
        viewModel.setSelectedCharId(id: id)
    }
    
    @IBAction func seeQuotesButtonTapped(_ sender: Any) {
        let quotesViewController = QuotesViewController(nibName: "QuotesViewController", bundle: nil)
        quotesViewController.setName(name: nameData)
        self.present(quotesViewController, animated: true)
        
    }
    
}
