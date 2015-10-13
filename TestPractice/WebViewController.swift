//
//  WebViewController.swift
//  TestPractice
//
//  Created by kyz on 15/10/13.
//  Copyright © 2015年 BUAA.Software. All rights reserved.
//

import UIKit

class WebViewController: UIViewController, UIWebViewDelegate {

    @IBOutlet weak var webView: UIWebView!
    
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    @IBAction func loadWeb(sender: AnyObject) {
        let url = NSURL(string: "https://achildfrombuaa.github.io")
        let request = NSURLRequest(URL: url!)
        self.webView.loadRequest(request)
        self.webView.delegate = self

    }
    func webViewDidStartLoad(webView: UIWebView) {
        progressView.progress += 0.3
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        progressView.progress += 0.7
        //print(webView.stringByEvaluatingJavaScriptFromString("document.body.innerHTML")!)
    }
}
