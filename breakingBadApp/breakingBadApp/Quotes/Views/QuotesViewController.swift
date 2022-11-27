//
//  QuotesViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit

class QuotesViewController: BaseViewController {
    
    @IBOutlet private weak var quotesImageView: UIImageView!
    @IBOutlet private weak var quotesTableView: UITableView!
    private var viewModel = QuotesVievModel()
    private var emptyData: [QuotesModel]? {
        didSet {
            quotesTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        quotesTableView.delegate = self
        quotesTableView.dataSource = self
        quotesTableView.register(UINib(nibName: "QuotesTableViewCell", bundle: nil), forCellReuseIdentifier: "quotesCell")
        viewModel.getData {
            self.emptyData = self.viewModel.setData()
            self.quotesImageView.image = self.viewModel.addImageForQuotes()
            self.indicator.stopAnimating()
            self.showAlertForQuotes()
        }
    }
    
    func setName(name: String?) {
        guard let name = name else { return }
        viewModel.setSelectedCharName(name: name)
    }
    
}

extension QuotesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.getCountOfData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = quotesTableView.dequeueReusableCell(withIdentifier: "quotesCell", for: indexPath) as? QuotesTableViewCell else { return UITableViewCell() }
        cell.setup(model: viewModel.getModel(atIndex: indexPath.row))
        return cell
    }
    
}


