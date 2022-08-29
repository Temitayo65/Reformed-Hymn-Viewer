//
//  WebViewController.swift
//  Hymns
//
//  Created by ADMIN on 29/08/2022.
//

import UIKit
import WebKit

class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    var selectedHymn: String!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView(frame: CGRect(x: 0.0, y: 0.0, width: 0.1, height: 0.1))
        webView.navigationDelegate = self
        view = webView
       
        // Do any additional setup after loading the view.
        let url = Bundle.main.url(forResource: selectedHymn , withExtension: ".pdf")
        webView.load(URLRequest(url: url!))
    }
    



}
