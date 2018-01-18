//
//  MenuDetailViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 1/4/18.
//  Copyright © 2018 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class MenuDetailViewController: UIViewController {
    
    var whichVC : Int?
    
    lazy var web : UIWebView = {
        let web = UIWebView()
        web.translatesAutoresizingMaskIntoConstraints = false
        web.isUserInteractionEnabled = true
        web.delegate = self
        web.backgroundColor = AppColor.blue
        web.scrollView.alwaysBounceHorizontal = false
        web.scrollView.showsHorizontalScrollIndicator = false
        web.scrollView.showsVerticalScrollIndicator = false
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
        setLogoToHeader()
        self.view.backgroundColor = AppColor.orange
        self.Activity.startAnimating()
        switch whichVC {
        case 0?:
            web.loadRequest(URLRequest(url: URL(string: "http://m.transavia.kz/ru/news/list/")!))
        case 1?:
            web.loadRequest(URLRequest(url: URL(string: "http://m.transavia.kz/ru/contacts/")!))
        default:
            print("aaa")
        }
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

extension MenuDetailViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
        self.Activity.stopAnimating()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        self.Activity.stopAnimating()
    }
}

