//
//  MyAccount.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 13/12/2020.
//

import UIKit

class MyCartVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "headerColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "tabBarColor")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "My Cart"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
    }
}
