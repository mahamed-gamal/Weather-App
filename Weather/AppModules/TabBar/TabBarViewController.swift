//
//  TabBarViewController.swift
//  Weather
//
//  Created by Mohamed Gamal on 7/23/19.
//  Copyright © 2019 ME. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    lazy var countriesList: UINavigationController = {
        let vc = CountriesListViewController(nibName: "CountriesListViewController", bundle: nil)
        vc.tabBarItem.title = "Countries"
        vc.tabBarItem.image = #imageLiteral(resourceName: "country")
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()
    
    lazy var profile: UINavigationController = {
        let vc = ProfileViewController()
        vc.tabBarItem.title = "Profile"
         vc.tabBarItem.image = #imageLiteral(resourceName: "profile")
        let nav = UINavigationController(rootViewController: vc)
        return nav
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

       setViewControllers([countriesList , profile ], animated: true)
    }
    
    
}
