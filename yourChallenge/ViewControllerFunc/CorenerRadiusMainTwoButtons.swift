//
//  CorenerRadiusMainTwoButtons.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 29.11.2021.
//

import Foundation
import UIKit

class CorenerRadiusMainTwoButtons{
    static let radiusMainTwoButtons = CorenerRadiusMainTwoButtons() // singltone
    
    func buttonCustomization(button buttonOne: UIButton, button buttonTwo: UIButton){
        
        func buttonSettings(button: UIButton){
            button.layer.cornerRadius = 32.0
            button.layer.borderWidth = 4
            button.layer.borderColor = UIColor(red: 224, green: 65, blue: 60, alpha: 100).cgColor
        }
        //MARK: - First Button
        buttonSettings(button: buttonOne)
        
        //MARK: - Second Button
        buttonSettings(button: buttonTwo)
        
    }
    
}
