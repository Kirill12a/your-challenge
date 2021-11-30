//
//  HexStringToUIColor.swift
//  yourChallenge
//
//  Created by Kirill Drozdov on 30.11.2021.
//

import Foundation
import UIKit

/// Класс, который содержит func, которая делает цвет по hex
final class HexStringToUIColor{
    static var hex = HexStringToUIColor()
    /// Принимает строку скопированную из поля hex
    /// - Returns: цвет, который конвертируется в rgb
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
