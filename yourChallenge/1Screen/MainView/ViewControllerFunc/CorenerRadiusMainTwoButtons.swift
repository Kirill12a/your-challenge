//
//  CorenerRadiusMainTwoButtons.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 29.11.2021.
//

import Foundation
import UIKit

protocol RadiusAndBorder{
    func buttonCustomization(button buttonOne: UIButton, button buttonTwo: UIButton)
}

final class CorenerRadiusMainTwoButtons: RadiusAndBorder{
    static let radiusMainTwoButtons = CorenerRadiusMainTwoButtons() // singltone
    
    func buttonCustomization(button buttonOne: UIButton, button buttonTwo: UIButton){
        
        func buttonSettings(button: UIButton){
            button.layer.cornerRadius = 32.0
            button.layer.borderWidth = 4
            button.layer.borderColor = HexStringToUIColor.hex.hexStringToUIColor(hex: "#E0413C").cgColor
        }
        
        //MARK: - First Button
        buttonSettings(button: buttonOne)
        
        //MARK: - Second Button
        buttonSettings(button: buttonTwo)
        
    }
    
}
 
