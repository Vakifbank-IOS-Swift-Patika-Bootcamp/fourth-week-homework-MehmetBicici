//
//  WebViewViewController.swift
//  breakingBadApp
//
//  Created by Mehmet Biçici on 27.11.2022.
//

import UIKit
import WebKit

final class WebViewViewController: BaseViewController {

    @IBOutlet private weak var imbdWebView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imbdWebView.load(URLRequest(url: URL(string: "https://www.imdb.com/")!))
    }


}
