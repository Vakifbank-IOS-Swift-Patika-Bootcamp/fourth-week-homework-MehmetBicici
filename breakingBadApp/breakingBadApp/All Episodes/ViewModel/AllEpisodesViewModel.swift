//
//  AllEpisodesViewModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import Foundation

class AllEpisodesViewModel {
    
    private var allEpisodesData: [ListOfAllEpisodesModel]?
    
    func getData(completion: @escaping(() -> Void)) {
        Client.getListOfAllEpisodes(seriesName: "Breaking+Bad") { data, error in
            self.allEpisodesData = data
            completion()
        }
    }
    
    func setData() -> [ListOfAllEpisodesModel] {
        return allEpisodesData ?? []
    }
    
    func getcountOfData() -> Int {
        return allEpisodesData?.count ?? 0
    }
    
    func getModel(atIndex: Int) -> ListOfAllEpisodesModel {
        return allEpisodesData?[atIndex] ?? ListOfAllEpisodesModel(episodeId: 0, season: "", title: "", episode: "",characters: [], series: "")
    }
    
    func getEpisodeId(atIndex: Int) -> Int {
        return allEpisodesData?[atIndex].episodeId ?? 0
    }
}
