//
//  Functions.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import Foundation
import UIKit

func rotateAnimation(view:UIButton,duration: CFTimeInterval = 0.6) {
    let rotateAnimation = CABasicAnimation(keyPath: "transform.rotation")
    rotateAnimation.fromValue = 0.0
    rotateAnimation.toValue = CGFloat(.pi * 2.0)
    rotateAnimation.duration = duration
    rotateAnimation.repeatCount = 1
    view.layer.add(rotateAnimation, forKey: nil)
}


