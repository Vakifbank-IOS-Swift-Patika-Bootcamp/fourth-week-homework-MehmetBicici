//
//  File.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import Foundation
import UIKit

class AllCharsViewModel {
    
    private var allCharsData: [ListOfAllCharsModel]?
    
    func getData(completion: @escaping (() -> Void)) {
        Client.getListOfAllChars {data, error in
            if let data = data {
                self.allCharsData = data
                completion()
            }
        }
    }
    
    func setData() -> [ListOfAllCharsModel] {
        return allCharsData ?? []
    }
    
    func getCountOfData() -> Int {
        return allCharsData?.count ?? 0
    }
    
    func getModel(atIndex: Int) -> ListOfAllCharsModel {
        
        return allCharsData?[atIndex] ?? ListOfAllCharsModel(charId: 0, name: "", birthday: "", nickname: "", img: "")
    }
    
    func getId(atIndex: Int) -> Int {
        return allCharsData?[atIndex].charId ?? 0
    }
    
}
