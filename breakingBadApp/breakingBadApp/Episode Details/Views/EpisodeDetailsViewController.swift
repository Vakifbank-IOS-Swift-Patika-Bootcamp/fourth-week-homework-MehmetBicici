//
//  EpisodeDetailsViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import UIKit

protocol EpisodeDetailsDelegate: AnyObject {
    func exitButtonTapped()
}

class EpisodeDetailsViewController: BaseViewController {
    
    private var viewModel = EpisodesDetailsViewModel()
    var emptyData: [EpisodeDetailsModel]? {
        didSet {
            performerTableView.reloadData()
        }
    }
    
    @IBOutlet private weak var exitButton: UIButton!
    @IBOutlet private weak var performerTableView: UITableView!
    weak var delegate: EpisodeDetailsDelegate?
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        performerTableView.delegate = self
        performerTableView.dataSource = self
        performerTableView.register(UINib(nibName: "EpisodeDetailsTableViewCell", bundle: nil), forCellReuseIdentifier: "episodeDetailsCell")
        viewModel.getData {
            self.emptyData = self.viewModel.setData()
            self.indicator.stopAnimating()
            self.showAlertForPerformers()
        }
    }
    
    func setEpisodeId(episodeId: Int?) {
        guard let episodeId = episodeId else { return }
        viewModel.setSelectedEpisodeId(id: episodeId)
    }
    
    @IBAction func exitButtonTapped(_ sender: Any) {
        self.delegate?.exitButtonTapped()
        dismiss(animated: true)
    }
}

extension EpisodeDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.getCountOfData()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = performerTableView.dequeueReusableCell(withIdentifier: "episodeDetailsCell", for: indexPath) as? EpisodeDetailsTableViewCell else { return UITableViewCell() }
        cell.setup(model: viewModel.getModel(), atIndex: indexPath.row)
        return cell
        
    }
}


