//
//  AllEpisodesViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import UIKit


class AllEpisodesViewController: BaseViewController {
    private let viewModel = AllEpisodesViewModel()
    private var emptyData: [ListOfAllEpisodesModel]? {
        didSet {
            allEpisodesTableView.reloadData()
        }
    }
    
    @IBOutlet private weak var allEpisodesTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        allEpisodesTableView.delegate = self
        allEpisodesTableView.dataSource = self
        allEpisodesTableView.register(UINib(nibName: "AllEpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: "allEpisodesCell")
        viewModel.getData {
            self.emptyData = self.viewModel.setData()
            self.indicator.stopAnimating()
            self.showAlertForAllEpisodes()
        }
    }
}

extension AllEpisodesViewController: EpisodeDetailsDelegate {
    func exitButtonTapped() {
         print("Exit Button Clicked!")
    }
}

extension AllEpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        viewModel.getcountOfData()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = allEpisodesTableView.dequeueReusableCell(withIdentifier: "allEpisodesCell", for: indexPath) as? AllEpisodesTableViewCell else { return UITableViewCell() }
        cell.setup(model: viewModel.getModel(atIndex: indexPath.row))
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedEpisodeId = viewModel.getEpisodeId(atIndex: indexPath.row)
        let episodeDetailsViewController = EpisodeDetailsViewController(nibName: "EpisodeDetailsViewController", bundle: nil)
        episodeDetailsViewController.setEpisodeId(episodeId: selectedEpisodeId)
        episodeDetailsViewController.delegate = self
        self.sheet(viewController: episodeDetailsViewController, animated: true,completion: nil)
    }
    
    func sheet(viewController: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        viewController.modalPresentationStyle = .fullScreen
        self.present(UINavigationController(rootViewController: viewController), animated: flag, completion: completion)
    }
    
}
