//
//  CreateTaskVC.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 30.11.2021.
//

import UIKit

class CreateTaskVC: UIViewController { // привет
    @IBOutlet weak var welcomeTextSV: UIStackView! {
        didSet{
            welcomeTextSV.transform = CGAffineTransform(rotationAngle:37.3)
        }
    }

    @IBOutlet weak var welcomTextSecondSV: UIStackView! { // напиши
        didSet{
            welcomTextSecondSV.transform = CGAffineTransform(rotationAngle: 38.2)
        }
    }

    @IBOutlet weak var goToTheTaskCreationScreen: UIButton!{
        didSet{
            goToTheTaskCreationScreen.layer.cornerRadius = 15
//            34
//            goToTheTaskCreationScreen.layer.borderWidt
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
    
}
