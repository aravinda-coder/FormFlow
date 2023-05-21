//
//  SecondHomeViewController.swift
//  FormFlow
//
//  Created by aravinda bandara on 2023-05-21.
//

import UIKit

class SecondHomeViewController: UIViewController {
    
    let logo = UIImageView()
    let stackView = UIStackView()
    let label = UILabel()
    let bimResult = UILabel()
    let selectLable = UILabel()
    let finishButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        setupLogo()
        configureStackView()
        configureNextButton()
        
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
    
    func configureStackView()
    {
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        addObjectToStackView()
        
        
        
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 5),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
 
         
                    ])
        
    }
    
    func addObjectToStackView()
    {
         

        let genderSelect = UISegmentedControl()
        genderSelect.backgroundColor = UIColor.white
        genderSelect.insertSegment(withTitle: "Weight Loss", at: 0, animated: true)
        genderSelect.insertSegment(withTitle: "Bulcking", at: 1, animated: true)
        genderSelect.insertSegment(withTitle: "Normal route", at: 1, animated: true)
        //genderSelect.insertSegment(withTitle: "Other", at: 1, animated: true)
        genderSelect.setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .selected)
        genderSelect.layer.borderWidth = 0.5
        
        genderSelect.layer.borderColor = UIColor.black.cgColor
        
        
        
        
        
       
        
        
        label.text = "Your BMI Value: 5"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.blue
        label.textAlignment = .center
        
        bimResult.text = "You are in Fat Level"
        bimResult.font = UIFont.boldSystemFont(ofSize: 20)
        bimResult.textColor = UIColor.red
        bimResult.textAlignment = .center

        selectLable.text = "Please select your goal plan"
        selectLable.font = UIFont.boldSystemFont(ofSize: 18)
        selectLable.textColor = UIColor.blue
        selectLable.textAlignment = .center
        
        stackView.addArrangedSubview(label)
        stackView.addArrangedSubview(bimResult)
        stackView.addArrangedSubview(selectLable)
        stackView.addArrangedSubview(genderSelect)
        
        

    }
    
    func configureNextButton(){
        view.addSubview(finishButton)
        finishButton.frame = CGRect(x: 50, y: 100, width: 200, height: 120)
        finishButton.setTitle("Finish", for: .normal)
        finishButton.setTitleColor(UIColor.white, for: .normal)
        finishButton.backgroundColor = UIColor.blue
        finishButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        finishButton.layer.cornerRadius = 8
        finishButton.clipsToBounds = true
        finishButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        
        finishButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            finishButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 80),
            finishButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            finishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
           //nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
            finishButton.heightAnchor.constraint(equalToConstant: 50)
         
                    ])
        
        
    }
    @objc func buttonTapped() {
            // Handle button tap event
       let nextWindow = DayListViewController()
        navigationController?.pushViewController(nextWindow, animated: true)
        
        }

}
