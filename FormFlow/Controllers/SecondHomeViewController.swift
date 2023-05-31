
import UIKit
var glGoal : String!
var glFitnessLevel : String!
var glbmi : String!
class SecondHomeViewController: UIViewController {
    let goalSelect = UISegmentedControl()
    let fitnessLevelSelect = UISegmentedControl()
    var userName: String!
        var height : String!
        var weight : String!
        var age :String!
        var gender : Int!
    
    let logo = UIImageView()
    let stackView = UIStackView()
    let label = UILabel()
    let bimResult = UILabel()
    let selectLable = UILabel()
    let finishButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        print("test")
        print(weight!)
        print(userName!)
        print(height!)
        print(gender!)
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
        
      
        goalSelect.backgroundColor = UIColor.white
        goalSelect.insertSegment(withTitle: "Weight loss", at: 0, animated: true)
        goalSelect.insertSegment(withTitle: "Muscle Building", at: 1, animated: true)
        goalSelect.insertSegment(withTitle: "Fitness maintain", at: 1, animated: true)
        //genderSelect.insertSegment(withTitle: "Other", at: 1, animated: true)
        goalSelect.setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .selected)
        goalSelect.layer.borderWidth = 0.5
        
        goalSelect.layer.borderColor = UIColor.black.cgColor
        
        
        
        fitnessLevelSelect.backgroundColor = UIColor.white
        fitnessLevelSelect.insertSegment(withTitle: "Beginner", at: 0, animated: true)
        fitnessLevelSelect.insertSegment(withTitle: "Intermediate", at: 1, animated: true)
        fitnessLevelSelect.insertSegment(withTitle: "Adavanced", at: 1, animated: true)
        //genderSelect.insertSegment(withTitle: "Other", at: 1, animated: true)
        fitnessLevelSelect.setTitleTextAttributes([.foregroundColor : UIColor.blue], for: .selected)
        fitnessLevelSelect.layer.borderWidth = 0.5
        
        fitnessLevelSelect.layer.borderColor = UIColor.black.cgColor
        
        
        
        
        
       
        
        
        //label.text = "Your BMI Value: 5"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.blue
        label.textAlignment = .center
        
        //bimResult.text = "You are in Fat Level"
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
        stackView.addArrangedSubview(goalSelect)
        stackView.addArrangedSubview(fitnessLevelSelect)
        
        if let bmi = calculationForBMI() {
                    let formattedBMI = String(format: "%.2f", bmi)
                    
                    let bmiCategory = findingCategory(forBMI: bmi)
                    var categoryText = ""
                    
                        switch bmiCategory {
                        case .underweight:
                            categoryText = "Underweight"
                        case .normalWeight:
                            categoryText = "Normal Weight"
                        case .overweight:
                            categoryText = "Overweight"
                        case .obese:
                            categoryText = "Obese"
                        }
                        
                        let category = categoryText
             print(formattedBMI)
            label.text = " your BMI : \(formattedBMI)"
            bimResult.text = " you are in : \(category)"
                } else {
                    // Handle invalid input or calculation error
                    label.text = "Invalid input"
                }
        
        
        

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
        assignUserInputs()
       let nextWindow = bottomNavigationViewController()
        navigationController?.pushViewController(nextWindow, animated: true)
        
        }
    
  
    
    func calculationForBMI() -> Double?{
                guard let heightValue = Double(height),
                         let weightValue = Double(weight),
                      let _ = Int(age) else {
                       return nil
                   }
              
                let heightInMeters = heightValue / 100 // Convert height from centimeters to meters
                    let bmi = weightValue / (heightInMeters * heightInMeters)
                    
                    // Adjust BMI calculation based on gender
                    if gender == 0 { // Male
                        return bmi * 1.0
                    } else if gender == 1 { // Female
                        return bmi * 0.9
                    }
                
                    
                    return nil
            }

        func findingCategory(forBMI bmi: Double) -> BMIStatus {
            if bmi < 18.5 {
                return .underweight
            } else if bmi < 25 {
                return .normalWeight
            } else if bmi < 30 {
                return .overweight
            } else {
                return .obese
            }
        }
    
    
    func assignUserInputs()
        {
            //glGoal = selectedOption;
            glbmi = bimResult.text
           
            let selectedFitnessIndex = fitnessLevelSelect.selectedSegmentIndex
            
            switch selectedFitnessIndex {
            case 0:
               
                glFitnessLevel = "Beginner"
               
            case 1:
              
                glFitnessLevel = "Advanced"
               
            case 2:
              
                glFitnessLevel = "Intermediate"
               
            default:
                break
            }
           
            
            let selectedGoalIndex = goalSelect.selectedSegmentIndex
            
            switch selectedGoalIndex {
            case 0:
               
                glGoal = "Weight loss"
               
            case 1:
              
                glGoal = "Muscle building"
               
            case 2:
              
                glGoal = "Fitness maintenance"
               
            default:
                break
            }
           

        }

}

enum BMIStatus {
    case underweight
    case normalWeight
    case overweight
    case obese
}
