//
//  BaseViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 27.11.2022.
//

import Foundation
import MaterialActivityIndicator
import SwiftAlertView
import UIKit

class BaseViewController: UIViewController {

    let indicator = MaterialActivityIndicatorView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicatorView()
    }
    
    private func setupActivityIndicatorView() {
        view.addSubview(indicator)
        setupActivityIndicatorViewConstraints()
    }
    
    private func setupActivityIndicatorViewConstraints() {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func showErrorAlert(message: String, completion: @escaping () -> Void) {
        SwiftAlertView.show(title: "Error",
                            message: message,
                            buttonTitles: ["OK"]).onButtonClicked { _, _ in
            completion()
        }
    }
    func showAlertForAllChars() {
        let alert = UIAlertController(title: "Characters Page Loaded", message: "Note: some players may not have photos!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertForAllEpisodes() {
        let alert = UIAlertController(title: "Episodes Page Loaded", message: "You can see whole episodes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertForPerformers() {
        let alert = UIAlertController(title: "Performers Info Page Loaded", message: "You can see the performers playing in this section", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertForCharDetails() {
        let alert = UIAlertController(title: "Character Details Page Loaded", message: "You can see the performer details", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func showAlertForQuotes() {
        let alert = UIAlertController(title: "Character Quotes Page Loaded", message: "You can see the performer's quotes", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    
}

