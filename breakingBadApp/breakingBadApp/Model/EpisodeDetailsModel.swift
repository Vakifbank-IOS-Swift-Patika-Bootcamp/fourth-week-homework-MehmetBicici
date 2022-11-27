//
//  EpisodeDetailsModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 21.11.2022.
//

import Foundation

struct EpisodeDetailsModel: Codable {
    let episodeId: Int
    let characters: [String]
    let title: String
    enum CodingKeys: String, CodingKey {
        case episodeId = "episode_id"
        case characters = "characters"
        case title = "title"
    }
}
