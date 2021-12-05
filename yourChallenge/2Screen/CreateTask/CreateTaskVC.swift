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

        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        goToTheTaskCreationScreen.isUserInteractionEnabled = true
        goToTheTaskCreationScreen.addGestureRecognizer(tapGestureRecognizer)
    }
            // нажатие на плюс
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer){
        let tappedButton = tapGestureRecognizer.view as! UIButton
        ShowViewController.showFunc.showMainApp(nameViewIdentifier: "WriteTextTaskVC")
        
    }
    
    
}
