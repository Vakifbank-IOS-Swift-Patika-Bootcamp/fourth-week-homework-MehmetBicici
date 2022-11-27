//
//  ListOfAllCharsModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 21.11.2022.
//

import Foundation

struct ListOfAllCharsModel: Codable {
    
    let charId: Int
    let name: String
    let birthday: String
    let nickname: String
    let img: String
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name = "name"
        case nickname = "nickname"
        case birthday = "birthday"
        case img = "img"
    }
}
