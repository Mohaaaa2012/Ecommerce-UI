//
//  TabBarController.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 08/12/2020.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarItems()
        view.backgroundColor = UIColor(named: "headerColor")
        navigationController?.navigationBar.barTintColor = UIColor(named: "tabBarColor")
        navigationController?.navigationBar.tintColor = .white
    }
    
    
    func setupTabbarItems() {
        
        let mainTabbarItem = UINavigationController(rootViewController: MainVC())
        mainTabbarItem.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        
        let dealsTabbarItem = UINavigationController(rootViewController: DealsVC())
        dealsTabbarItem.tabBarItem = UITabBarItem(title: "Deals", image: UIImage(systemName: "tag"), tag: 1)
        
        let searchTabbarItem = UINavigationController(rootViewController: SearchVC())
        searchTabbarItem.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 2)
        
        let cartTabbarItem = UINavigationController(rootViewController: MyCartVC())
        cartTabbarItem.tabBarItem = UITabBarItem(title: "My Cart", image: UIImage(systemName: "cart"), tag: 3)
        
        let userTabbarItem = UINavigationController(rootViewController: MyAccountVC())
        userTabbarItem.tabBarItem = UITabBarItem(title: "My Account", image: UIImage(systemName: "person"), tag: 4)
        
        viewControllers = [mainTabbarItem, dealsTabbarItem, searchTabbarItem, cartTabbarItem, userTabbarItem]
    }
    
}

