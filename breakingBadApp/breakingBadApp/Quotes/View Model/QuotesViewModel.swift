//
//  QuotesViewModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 25.11.2022.
//

import Foundation
import UIKit
class QuotesVievModel {
        
    private var selectedName = String()
    private var quotesData: [QuotesModel]?
    
    func setSelectedCharName(name: String) {
        self.selectedName = name.replacingOccurrences(of: " ", with: "+")
    }
    
    func getData(completion: @escaping(() -> Void)) {
    
        Client.getQuotes(quotesOwner: selectedName) { data, error in
            if let data = data {
                self.quotesData = data
                completion()
            }
        }
    }
    
    func setData() -> [QuotesModel] {
        return quotesData ?? []
    }
    
    func getCountOfData() -> Int {
        return quotesData?.count ?? 0
    }
    
    func getModel(atIndex: Int) -> QuotesModel {
        return quotesData?[atIndex] ?? QuotesModel(quote: "", author: "", quoteId: 0)
    }
    
    func addImageForQuotes() -> UIImage {
        let image = UIImage(named: "quotes.image")!
        return image
    }
    
}
