//
//  OpenPageViewModel.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import Foundation
import UIKit

class OpenPageViewModel {
        
    func addImageForBackground() -> UIImage {
        let image = UIImage(named: "breaking.bad.open.page.wp")!
        return image
    }
    
    func addImageForTitle() -> UIImage {
        let image = UIImage(named: "breaking.bad.logo")!
        return image
    }
}
