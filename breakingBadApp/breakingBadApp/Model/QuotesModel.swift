//
//  QuotesModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 21.11.2022.
//

import Foundation

struct QuotesModel: Codable {
    
    let quote: String
    let author: String
    let quoteId: Int
    enum CodingKeys: String, CodingKey {
        case quote = "quote"
        case author = "author"
        case quoteId = "quote_id"
    }
}
