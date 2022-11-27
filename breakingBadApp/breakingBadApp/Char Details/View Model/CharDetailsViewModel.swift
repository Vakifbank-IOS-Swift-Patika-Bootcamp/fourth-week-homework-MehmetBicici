//
//  CharDetailsViewModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import Foundation
import UIKit




class CharDetailsViewModel {
    private let staticImageThumbnailOfBB = "https://e7.pngegg.com/pngimages/65/392/png-clipart-logo-jesse-pinkman-film-poster-font-breaking-bad-text-poster-thumbnail.png"
    private var charDetailsData: [CharDetailsModels]?
    private var selectedid = Int()
    
    func setSelectedCharId(id: Int) {
        self.selectedid = id
    }
    
    func getData(completion: @escaping (() -> Void)) {
        Client.getCharDetails(id: selectedid) { data, error in
            if let data = data {
                self.charDetailsData = data
                completion()
            }
        }
    }
    
    func setData() -> [CharDetailsModels] {
        return charDetailsData ?? []
    }
    
    func getName(data: [CharDetailsModels] ) -> String {
        for name in data {
            return name.name
        }
        return ""
    }
    
    func getImage(data: [CharDetailsModels]) -> URL {
        for imageName in data {
            if let url = URL(string: imageName.img) {
                return url
            }
        }
        return URL(string: staticImageThumbnailOfBB)!
    }
    
    func getNickname(data: [CharDetailsModels] ) -> String {
        for nickName in data {
            return nickName.nickname
        }
        return ""
    }
    
    func getBirthday(data: [CharDetailsModels] ) -> String {
        for birthday in data {
            return birthday.birthday
        }
        return ""
    }
    
    func getPortrayed(data: [CharDetailsModels] ) -> String {
        for portrayed in data {
            return portrayed.portrayed
        }
        return ""
    }
    func addImageForDetail() -> UIImage {
        let image = UIImage(named: "detail.image")!
        return image
    }
    
}

