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

        webView.uiDelegate = self
        
        webView.isOpaque = false
        webView.backgroundColor = UIColor.clear
        webView.allowsBackForwardNavigationGestures = false

        //let url = URL(string: "https://www.inteligolife.com/app/")!
        let url = URL(string: "http://dev.asixonline.com/inteligolife_app")!
        webView.load(URLRequest(url: url))
        
    }

    
    
    override var prefersStatusBarHidden: Bool{
        return true
    }

}

extension ViewController: WKUIDelegate {

    func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if let frame = navigationAction.targetFrame,
                frame.isMainFrame {
                return nil
            }
            webView.load(navigationAction.request)
            return nil
    }

}
