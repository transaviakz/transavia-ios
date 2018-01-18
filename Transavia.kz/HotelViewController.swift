//
//  HotelViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class HotelViewController: UIViewController {
    
    lazy var a : UIImageView = {
        let a = UIImageView()
        a.image = UIImage(named:"oops")
        a.contentMode = .scaleAspectFit
        return a
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLogoToHeader()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bckg")!)
        self.view.addSubview(a)
        a.easy.layout(Height(300.heightProportion()),Width(300.widthProportion()),Top(100.heightProportion()),CenterX(0))
    }
}
