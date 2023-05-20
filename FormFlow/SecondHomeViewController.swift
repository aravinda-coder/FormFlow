//
//  SecondHomeViewController.swift
//  FormFlow
//
//  Created by aravinda bandara on 2023-05-21.
//

import UIKit

class SecondHomeViewController: UIViewController {
    
    let logo = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLogo()
    }
    
    func setupLogo()
    {
        view.addSubview(logo)
        logo.translatesAutoresizingMaskIntoConstraints = false
        logo.image = UIImage(named: "bmi")
        //making position using constrains
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 1),
            logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logo.heightAnchor.constraint(equalToConstant: 250),
            logo.widthAnchor.constraint(equalToConstant: 250)
                    ])
        
        
    }

}
