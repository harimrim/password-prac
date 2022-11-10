//
//  ViewController.swift
//  passwordPrac
//
//  Created by 김하림 on 2022/11/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var levelView: UIView!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var passwordInput: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func passwordValidator(password:String) -> Int {
        
        let pattern1 = "^[0-9]*$.{0,7}"
        let pattern2 = "^[a-zA-Z]*$.{0,7}"
        let pattern4 = "^[a-zA-Z(?=.*?[0-9])]{8,}$"
        let pattern5 = "^[\\w~!@#\\$%\\^&\\*]{8,}$"
        
        if (password.range(of: pattern1, options: .regularExpression) != nil && true){
            return 1
        } else if (password.range(of: pattern2, options: .regularExpression) != nil && true) {
            return 2
        } else if (password.range(of: pattern4, options: .regularExpression) != nil && true) {
            return 4
        } else if (password.range(of: pattern5, options: .regularExpression) != nil && true) {
            return 5
        } else {
            return 3
        }
        
    }


    @IBAction func checkButton(_ sender: UIButton) {
        let RED = UIColor(named: "red")
        let ORANGE = UIColor(named: "orange")
        let YELLOW = UIColor(named: "yellow")
        let BLUE = UIColor(named: "blue")
        let GREEN = UIColor(named: "green")
        var password = passwordInput.text
        var result = passwordValidator(password: password!)
        descriptionLabel.text = String(result)
        
        switch result {
        case 1:
            levelView.backgroundColor = RED
        case 2:
            levelView.backgroundColor = ORANGE
        case 3:
            levelView.backgroundColor = YELLOW
        case 4:
            levelView.backgroundColor = BLUE
        case 5:
            levelView.backgroundColor = GREEN
        default:
            break
        }
        
    }
}

