//
//  MenuViewController.swift
//  Transavia.kz
//
//  Created by Erbol  on 12/7/17.
//  Copyright © 2017 Erbol . All rights reserved.
//

import UIKit
import EasyPeasy

class MenuViewController: UIViewController {
    
    var menuItems = ["Новости","Контакты"]
    
    lazy var tableView : UITableView = {
        let tV = UITableView()
        tV.delegate = self
        tV.dataSource = self
        tV.tableFooterView = UIView()
        tV.isScrollEnabled = false
        tV.showsVerticalScrollIndicator = false
        tV.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tV.layer.borderWidth = 0.5
        tV.layer.borderColor = UIColor.lightGray.cgColor
        return tV
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColor.aliceblue
        setLogoToHeader()
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        [tableView].forEach {
            self.view.addSubview($0)
        }
    }
    func setupConstraints() {
tableView.easy.layout(Top(15.heightProportion()),Left(0),Right(0),Height(70.heightProportion()*CGFloat(menuItems.count)))
    }
}

extension MenuViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = MenuDetailViewController()
        nextVC.whichVC = indexPath.row
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

extension MenuViewController: UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.preservesSuperviewLayoutMargins = false
        cell.separatorInset = UIEdgeInsets.zero
        cell.layoutMargins = UIEdgeInsets.zero
        cell.accessoryType = .disclosureIndicator
//        cell.textLabel?.font = UIFont(name:"Geometria",size:(cell.textLabel?.font.pointSize)!)
        cell.textLabel?.textAlignment = .left
        cell.textLabel?.text = menuItems[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.heightProportion()
    }
}
