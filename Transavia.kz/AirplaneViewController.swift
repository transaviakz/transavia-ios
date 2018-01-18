//
//  AirplaneViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class AirplaneViewController: UIViewController {
    
    lazy var web : UIWebView = {
        let web = UIWebView()
        web.loadRequest(URLRequest(url: URL(string: "http://m.transavia.kz")!))
        web.translatesAutoresizingMaskIntoConstraints = false
        web.isUserInteractionEnabled = true
        web.delegate = self
        web.backgroundColor = AppColor.blue
        web.scalesPageToFit = false
        web.isMultipleTouchEnabled = false
        return web
    }()
//    lazy var Activity : UIActivityIndicatorView = {
//        let a = UIActivityIndicatorView()
//        a.activityIndicatorViewStyle = .gray
//        a.hidesWhenStopped = true
//        a.backgroundColor = AppColor.blue
//        return a
//    }()
    var images : [UIImage] = []
    lazy var backabc : UIView = {
        let b = UIView()
        b.backgroundColor = UIColor(patternImage: UIImage(named: "bckg")!)
        return b
    }()
    lazy var abc : UIImageView = {
        let a = UIImageView()
        a.contentMode = .scaleAspectFit
        a.animationRepeatCount = 1
        a.animationImages = images
        a.animationDuration = 3
        return a
    }()
    var counter = 1
    override func viewDidLoad() {
        super.viewDidLoad()
        for index in 1...20 {
            self.images.append(UIImage(named:"\(index)")!)
        }
        self.view.backgroundColor = AppColor.blue
        setLogoToHeader()
//        self.Activity.startAnimating()
        setupViews()
        setupConstraints()
        abc.startAnimating()
    }
    func setupViews(){
        [web,backabc].forEach {
            self.view.addSubview($0)
        }
        self.backabc.addSubview(abc)
    }
    func setupConstraints() {
        web.easy.layout(Edges(0))
        backabc.easy.layout(Edges(0))
    abc.easy.layout(CenterX(0),Top(150.heightProportion()),Width(100.widthProportion()),Height(200.heightProportion()))
//        Activity.easy.layout(Edges(0))
    }
}
extension AirplaneViewController : UIWebViewDelegate {
    func webViewDidFinishLoad(_ webView: UIWebView) {
//        self.Activity.stopAnimating()
        abc.stopAnimating()
        abc.removeFromSuperview()
        backabc.removeFromSuperview()
    }
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
//        self.Activity.stopAnimating()
        abc.stopAnimating()
        abc.removeFromSuperview()
        backabc.removeFromSuperview()
    }
}

