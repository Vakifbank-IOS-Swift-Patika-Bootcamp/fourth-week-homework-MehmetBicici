//
//  ListOfAllEpisodesModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import Foundation

import Foundation

struct ListOfAllEpisodesModel: Codable {
    let episodeId: Int
    let season: String
    let title: String
    let episode: String
    let characters: [String]
    let series: String
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case season = "season"
        case title = "title"
        case episode = "episode"
        case characters = "characters"
        case series = "series"
    }
}
