//
//  TabbarController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 23.11.2022.
//

import Foundation
import UIKit

class TabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.barTintColor = .black
        tabBar.isTranslucent = false
        let selectedColor   = UIColor(red: 246.0/255.0, green: 155.0/255.0, blue: 13.0/255.0, alpha: 1.0)
            let unselectedColor = UIColor(red: 16.0/255.0, green: 224.0/255.0, blue: 223.0/255.0, alpha: 1.0)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: unselectedColor], for: .normal)
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: selectedColor], for: .selected)
        let allCharsViewController = AllCharsViewController()
        let allEpisodesViewController = AllEpisodesViewController()
        let openPageViewController = OpenPageViewController()
        let webViewController = WebViewViewController()
        allCharsViewController.title = "Chars"
        allEpisodesViewController.title = "Episodes"
        openPageViewController.title = "Open"
        webViewController.title = "IMDB"
        self.setViewControllers([openPageViewController,allEpisodesViewController,allCharsViewController,webViewController], animated: true)
    }
}
