//
//  TabViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit

class TabViewController: UITabBarController {
    
    var BottomIcons = [UIImage(named:"airplane-icon"),UIImage(named:"train-icon"),UIImage(named:"hotel-icon"),UIImage(named:"menu-icon")]

    override func viewDidLoad() {
        super.viewDidLoad()
        let ncairplane = UINavigationController()
        ncairplane.navigationBar.isTranslucent = false
        ncairplane.viewControllers = [AirplaneViewController()]
        let ncmenu = UINavigationController()
        ncmenu.navigationBar.isTranslucent = false
        ncmenu.viewControllers = [MenuViewController()]
        let nctrain = UINavigationController()
        nctrain.navigationBar.isTranslucent = false
        nctrain.viewControllers = [TrainViewController()]
        let nchotel = UINavigationController()
        nchotel.navigationBar.isTranslucent = false
        nchotel.viewControllers = [HotelViewController()]
        self.viewControllers = [ncairplane,nctrain,nchotel,ncmenu]
        self.tabBar.barTintColor = AppColor.blue
        self.tabBar.tintColor = AppColor.orange
        if #available(iOS 10.0, *) {
            self.tabBar.unselectedItemTintColor = .white
        } else {
            // Fallback on earlier versions
        }
        
        for  (index, item) in (self.tabBar.items?.enumerated())! {
            item.image = BottomIcons[index]
            item.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0)
            item.title = nil
        }
    }
}
