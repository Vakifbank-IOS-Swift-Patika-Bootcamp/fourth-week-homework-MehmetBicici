//
//  CharDetailsModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 21.11.2022.
//

import Foundation

struct CharDetailsModels: Codable {
    
    let charId: Int
    let name: String
    let nickname: String
    let portrayed: String
    let img: String
    let birthday: String
    
    enum CodingKeys: String, CodingKey {
        case charId = "char_id"
        case name = "name"
        case nickname = "nickname"
        case portrayed = "portrayed"
        case img = "img"
        case birthday = "birthday"
    }
}

