//
//  ViewController.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 29.11.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doneButton: UIButton!{
        didSet{
          
        }
    }
    @IBOutlet weak var historyButton: UIButton!{
        didSet{
            
        }
    }
    override func loadView() {
        super.loadView()
        CorenerRadiusMainTwoButtons.radiusMainTwoButtons.buttonCustomization(button: doneButton, button: historyButton)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
            }


}

