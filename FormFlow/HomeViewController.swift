

import UIKit

class HomeViewController: UIViewController {

    //creating of components
    //let backgroundImageView = UIImageView()
       let logo = UIImageView()
       let  stackView = UIStackView()
       let label = UILabel()
       let nextButton = UIButton()
       
       
    // should be called all the outside function here to work
       override func viewDidLoad() {
           super.viewDidLoad()
           view.backgroundColor = UIColor.link
           
           setupLogo()
           configureStackView()
           configureNextButton()
         
       }

       func setupLogo()
       {
           view.addSubview(logo)
           logo.translatesAutoresizingMaskIntoConstraints = false
           logo.image = UIImage(named: "logo")
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
               stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 1),
               stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
               stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
               //stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -70),
    
            
                       ])
           
       }

       func addObjectToStackView()
       {
            let textField1 = UITextField()
            textField1.placeholder = "Enter your name here"
           textField1.backgroundColor = UIColor.white
           textField1.layer.borderWidth = 0.5
           textField1.borderStyle = .roundedRect
           textField1.layer.borderColor = UIColor.black.cgColor

           let textField2 = UITextField()
           textField2.placeholder = "Enter your height here"
           textField2.backgroundColor = UIColor.white
           textField2.borderStyle = .roundedRect
           textField2.layer.borderWidth = 0.5
           textField2.layer.borderColor = UIColor.black.cgColor

           let textField3 = UITextField()
           textField3.placeholder = "Enter your weight here"
           textField3.backgroundColor = UIColor.white
           textField3.borderStyle = .roundedRect
           textField3.layer.borderWidth = 0.5
           textField3.layer.borderColor = UIColor.black.cgColor

           let textField4 = UITextField()
           textField4.placeholder = "Enter your age here"
           textField4.backgroundColor = UIColor.white
           textField4.borderStyle = .roundedRect
           textField4.layer.borderWidth = 0.5
           textField4.layer.borderColor = UIColor.black.cgColor

           let genderSelect = UISegmentedControl()
           genderSelect.backgroundColor = UIColor.white
           genderSelect.insertSegment(withTitle: "Male", at: 0, animated: true)
           genderSelect.insertSegment(withTitle: "Female", at: 1, animated: true)
           genderSelect.setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .selected)
           genderSelect.layer.borderWidth = 0.5
           genderSelect.layer.borderColor = UIColor.black.cgColor
           
           
           
           
           
          
           
           label.text = "Start and Go Ahead"
           label.font = UIFont.boldSystemFont(ofSize: 25)
           label.textColor = UIColor.white
           label.textAlignment = .center

           stackView.addArrangedSubview(label)
           stackView.addArrangedSubview(textField1)
           stackView.addArrangedSubview(textField2)
           stackView.addArrangedSubview(textField3)
           stackView.addArrangedSubview(textField4)
           stackView.addArrangedSubview(genderSelect)
           
           

       }
    
    func configureNextButton(){
        view.addSubview(nextButton)
        nextButton.frame = CGRect(x: 50, y: 100, width: 200, height: 120)
        nextButton.setTitle("Next >", for: .normal)
        nextButton.setTitleColor(UIColor.blue, for: .normal)
        nextButton.backgroundColor = UIColor.white
        nextButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        nextButton.layer.cornerRadius = 8
        nextButton.clipsToBounds = true
        nextButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 20),
            nextButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 80),
            nextButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -80),
           //nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -180),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
         
                    ])
        
        
    }
       
       @objc func buttonTapped() {
               // Handle button tap event
          let nextWindow = SecondHomeViewController()
           navigationController?.pushViewController(nextWindow, animated: true)
           
           }
       
       func setupLabel()
       {
           
           
       }

}

