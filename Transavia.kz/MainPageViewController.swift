//
//  MainPageViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/6/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class MainPageViewController: UIViewController {
    
    lazy var logo: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var airplane : UIButton = {
        let air = UIButton()
        air.setImage(UIImage(named: "airplane"), for: .normal)
        air.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        air.alpha = 0
        air.layer.borderColor = UIColor.clear.cgColor
        air.layer.shadowOpacity = 0.7
        air.layer.shadowOffset = CGSize(width: 7.widthProportion(), height: 7.heightProportion())
//        air.layer.shadowRadius = 15.0
        air.layer.shadowColor = UIColor.black.cgColor
        return air
    }()
    lazy var train : UIButton = {
        let trn = UIButton()
        trn.setImage(UIImage(named: "train"), for: .normal)
        trn.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        trn.alpha = 0
        trn.layer.borderColor = UIColor.clear.cgColor
        trn.layer.shadowOpacity = 0.7
        trn.layer.shadowOffset = CGSize(width: 7.widthProportion(), height: 7.heightProportion())
        //        air.layer.shadowRadius = 15.0
        trn.layer.shadowColor = UIColor.black.cgColor
        return trn
    }()
    lazy var hotel : UIButton = {
        let htl = UIButton()
        htl.setImage(UIImage(named: "hotel"), for: .normal)
        htl.addTarget(self, action: #selector(pressed(sender:)), for: .touchUpInside)
        htl.alpha = 0
        htl.layer.borderColor = UIColor.clear.cgColor
        htl.layer.shadowOpacity = 0.7
        htl.layer.shadowOffset = CGSize(width: 7.widthProportion(), height: 7.heightProportion())
        //        air.layer.shadowRadius = 15.0
        htl.layer.shadowColor = UIColor.black.cgColor
        return htl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(patternImage: UIImage(named: "bckg")!)
        self.setupViews()
        self.setupConstraints()
        UIView.animate(withDuration: 1, delay: 0.2, options: [], animations: {
            self.logo.transform = slide.top
        }, completion: { finished in
            UIView.animate(withDuration: 0.2, delay: 0.3, options: .curveEaseOut, animations: {
                self.airplane.alpha = 1.0
                self.hotel.alpha = 1.0
                self.train.alpha = 1.0
            }, completion: nil)
        })
    }
    func setupViews(){
        [logo,airplane,train,hotel].forEach {
            self.view.addSubview($0)
        }
    }
    func setupConstraints() {
        logo.easy.layout(Top(345.heightProportion()),CenterX(0),Width(300.widthProportion()),Height(70.heightProportion()))
        airplane.easy.layout(Top(265.heightProportion()),CenterX(0),Width(90.widthProportion()),Height(90.heightProportion()))
        train.easy.layout(Top(20.heightProportion()).to(airplane),Height().like(airplane),Width().like(airplane),Left(0).to(airplane))
        hotel.easy.layout(Top(20.heightProportion()).to(airplane),Height().like(airplane),Width().like(airplane),Right(0).to(airplane))
    }
    @objc func pressed(sender: UIButton) {
        let nextVC = TabViewController()
        switch sender {
        case self.airplane:
            nextVC.selectedIndex = 0
            self.present(nextVC, animated: true, completion: nil)
        case self.train:
            nextVC.selectedIndex = 1
            self.present(nextVC, animated: true, completion: nil)
        case self.hotel:
            nextVC.selectedIndex = 2
            self.present(nextVC, animated: true, completion: nil)
        default:
            print("pressed")
        }
    }
}
