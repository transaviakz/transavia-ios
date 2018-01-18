//
//  extensions.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/30/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import Foundation
import UIKit
import EasyPeasy

extension Int{
    func heightProportion() -> CGFloat {
        return CGFloat(self)*Screen.heightProportion
    }
    func widthProportion() -> CGFloat {
        return CGFloat(self)*Screen.widthProportion
    }
}

extension UIViewController {
    func setLogoToHeader(){
        let image = UIImage(named: "logo")
        let imageView = UIImageView(image:image)
        imageView.easy.layout(CenterX(0),Width(180.widthProportion()),Height(50.heightProportion()))
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
}
