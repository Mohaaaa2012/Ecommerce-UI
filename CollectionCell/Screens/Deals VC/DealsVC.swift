//
//  DealsVC.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 12/12/2020.
//

import UIKit

class DealsVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "headerColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "tabBarColor")
        navigationController?.navigationBar.tintColor = .white
        navigationItem.title = "Deals"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white,
                                                                   NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)]
        
    }
}
