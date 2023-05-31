//
//  bottomNavigationViewController.swift
//  FormFlow
//
//  Created by aravinda bandara on 2023-05-31.
//

import UIKit

class bottomNavigationViewController: UIViewController {

    let tabBar = UITabBarController()

        override func viewDidLoad() {
            super.viewDidLoad()
            setupTtab()
            // Do any additional setup after loading the view.
        }
        
        func setupTtab()
        {
            let firstVC = UINavigationController(rootViewController:DayListViewController())
            let secondVC = UINavigationController(rootViewController:CustomScheduleViewController())
            let thirdVC = UINavigationController(rootViewController:ProfileViewController())
            
            firstVC.title = "Exercises"
            secondVC.title = "Custom"
            thirdVC.title = "Profile"
            
            tabBar.setViewControllers([firstVC,secondVC,thirdVC], animated: true)

            
            guard let items = tabBar.tabBar.items else{
                return
            }
            
            let images = ["heart","pencil.circle","person.circle"]
            
            for x in 0..<items.count {
                items[x].image = UIImage(systemName: images[x])
            }
            
            tabBar.modalPresentationStyle = .fullScreen
            present(tabBar,animated: true)
            
            
        }

}
