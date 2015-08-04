//
//  ViewController.swift
//  multi-touch-draw
//
//  Created by Jonah Stiennon on 8/4/15.
//  Copyright (c) 2015 Jonah Stiennon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let frame = CGRectMake(0, 0, 200, 200)
        let webview = UIWebView(frame: frame)
        webview.setTranslatesAutoresizingMaskIntoConstraints(false)
        let url : NSURL = NSURL(string: "http://jonahss.github.io/multi-touch-draw")!
        webview.loadRequest(NSURLRequest(URL: url))
        webview.delegate = self
        self.view.addSubview(webview)
        
        let heightConstraint : NSLayoutConstraint = NSLayoutConstraint.constraintsWithVisualFormat("V:[webview(==superview)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["webview": webview, "superview": self.view])[0] as! NSLayoutConstraint
        let widthConstraint : NSLayoutConstraint = NSLayoutConstraint.constraintsWithVisualFormat("H:[webview(==superview)]", options: NSLayoutFormatOptions(0), metrics: nil, views: ["webview": webview, "superview":self.view])[0] as! NSLayoutConstraint
        
        view.addConstraint(widthConstraint)
        view.addConstraint(heightConstraint)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func webView(webView: UIWebView, didFailLoadWithError error: NSError) {
        print("Webview fail with error \(error)");
    }
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        return true;
    }
    
    func webViewDidStartLoad(webView: UIWebView) {
        print("Webview started Loading")
    }
    
    func webViewDidFinishLoad(webView: UIWebView) {
        print("Webview did finish load")
    }


}

