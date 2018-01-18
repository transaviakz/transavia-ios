//
//  TrainViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class TrainViewController: UIViewController {
    
    lazy var web : UIWebView = {
        let web = UIWebView()
        web.loadRequest(URLRequest(url: URL(string: "http://railway.transavia.kz/m")!))
        web.translatesAutoresizingMaskIntoConstraints = false
        web.isUserInteractionEnabled = true
        web.delegate = self
        web.backgroundColor = AppColor.blue
        web.scalesPageToFit = false
        web.isMultipleTouchEnabled = false
        return web
    }()
    lazy var Activity : UIActivityIndicatorView = {
        let a = UIActivityIndicatorView()
        a.activityIndicatorViewStyle = .gray
        a.hidesWhenStopped = true
        a.backgroundColor = AppColor.blue
        return a
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.blue
        setLogoToHeader()
        self.Activity.startAnimating()
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        [web,Activity].forEach {
            self.view.addSubview($0)
        }
    }
    func setupConstraints() {
        web.easy.layout(Edges(0))
        Activity.easy.layout(Edges(0))
    }
}

extension TrainViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.Activity.stopAnimating()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.Activity.stopAnimating()
    }
}

