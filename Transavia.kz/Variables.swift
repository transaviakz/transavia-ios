//
//  Variables.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import Foundation
import UIKit

struct AppColor {
    static let orange = UIColor(red: 255/255.0, green: 87/255.0, blue: 34/255.0, alpha: 1)
    static let blue =  UIColor(red: 2/255.0, green: 136/255.0, blue: 209/255.0, alpha: 1)
    static let aliceblue = UIColor(red: 241/255.0, green: 247/255.0, blue: 253/255.0, alpha: 1)
}

struct slide{
    static let top = CGAffineTransform(translationX: 0, y: -200)
}

struct Screen  {
    static var width = UIScreen.main.bounds.width
    static var height = UIScreen.main.bounds.height
    static var widthProportion = width/375
    static var heightProportion = height/667
}


