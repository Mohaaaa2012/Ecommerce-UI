//
//  ViewController2.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 08/12/2020.
//

import UIKit

class MyAccountVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "headerColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "tabBarColor")
        navigationController?.navigationBar.alpha = 1
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "My Account"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
    }
    

}
