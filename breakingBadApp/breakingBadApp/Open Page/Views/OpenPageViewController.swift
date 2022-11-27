//
//  OpenPageViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import UIKit

class OpenPageViewController: UIViewController {
    
    private let viewModel = OpenPageViewModel()
    
    @IBOutlet private weak var titleImageView: UIImageView!
    @IBOutlet private weak var openImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        openImageView.image = viewModel.addImageForBackground()
        titleImageView.image = viewModel.addImageForTitle()
    }

}
