//
//  OriginalTabBarViewController.swift
//  FormFlow
//
//  Created by aravinda bandara on 2023-05-21.
//

import UIKit

class OriginalTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabs()
        self.tabBar.barTintColor = .red

        
    }
    
    // make - tab setups
    
    private func setupTabs(){
        let home = self.createNav(with: "Home", and: UIImage(systemName: "logo"), vc: HomeViewController())
        self.setViewControllers([home], animated: true)
    }
    
    private func createNav(with title: String, and image: UIImage?, vc:UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: vc)
        nav.viewControllers.first?.navigationItem.title = title + " controller "
        nav.viewControllers.first?.navigationItem.rightBarButtonItem = UIBarButtonItem(title:"button", style: .plain, target: nil, action: nil)
        return nav
    }

}
