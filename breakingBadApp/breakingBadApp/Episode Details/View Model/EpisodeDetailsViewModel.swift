//
//  EpisodeDetailsViewModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import Foundation

class EpisodesDetailsViewModel {
    
    private var episodeDetailsData: [EpisodeDetailsModel]?
    private var selectedEpisodeId = Int()
    
    func setSelectedEpisodeId(id: Int) {
        self.selectedEpisodeId = id
    }
    
    func getData(completion: @escaping (() -> Void)) {
        Client.getEpisodeDetails(id: selectedEpisodeId) { data, eror in
            if let data = data {
                self.episodeDetailsData = data
                completion()
            }
        }
    }
    
    func setData() -> [EpisodeDetailsModel] {
        return episodeDetailsData ?? []
    }
    
    func getCountOfData() -> Int {
        return episodeDetailsData?[0].characters.count ?? 0
    }
    
    func getModel() -> [String] {
        return episodeDetailsData?[0].characters ?? []
    }
    
    func getPerformerName(atIndex: Int) {
        
    }

}
