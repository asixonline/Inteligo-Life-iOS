//
//  ViewController.swift
//  Inteligo-Life-iOS
//
//  Created by fischer on 23/09/19.
//  Copyright © 2019 Inteligo Bank. All rights reserved.
//

import UIKit
import WebKit


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let webView = WKWebView(frame: view.frame)
        view.addSubview(webView)
        
        let url = URL(string: "http://dev.asixonline.com/inteligolife_app/")!
        //let url = URL(string: "https://www.inteligolife.com/")!
        webView.load(URLRequest(url: url))
        webView.allowsBackForwardNavigationGestures = false

    }

    override var prefersStatusBarHidden: Bool{
        return true
    }
    

}

