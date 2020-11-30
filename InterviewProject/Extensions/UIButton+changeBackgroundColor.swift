//
//  UIButton+changeBackGroundColor.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/25/20.
//

import UIKit

extension UIButton {
    var setTextColor: UIColor {
        switch titleLabel?.text {
        case ButtonLabels.yellow:
            return UIColor.systemYellow
        case ButtonLabels.blue:
            return UIColor.systemBlue
        case ButtonLabels.green:
            return UIColor.systemGreen
        case ButtonLabels.indigo:
            return UIColor.systemIndigo
        case ButtonLabels.orange:
            return UIColor.systemOrange
        default:
            return UIColor.systemPurple
        }
    }
}
