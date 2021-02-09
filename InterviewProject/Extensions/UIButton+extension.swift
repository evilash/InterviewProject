//
//  UIButton+extension.swift.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/25/20.
//

import UIKit

extension UIButton {
    var setTextColor: UIColor {
        switch titleLabel?.text {
        case ButtonLabels.yellow.id:
            return UIColor.systemYellow
        case ButtonLabels.blue.id:
            return UIColor.systemBlue
        case ButtonLabels.green.id:
            return UIColor.systemGreen
        case ButtonLabels.indigo.id:
            return UIColor.systemIndigo
        case ButtonLabels.orange.id:
            return UIColor.systemOrange
        default:
            return UIColor.systemPurple
        }
    }
    
    func configureButton(buttonTitle: ButtonLabels, accessibilityElement: Bool = true, accessibilityId: String? = nil) {
        setTitle(buttonTitle.id, for: .normal)
        isAccessibilityElement = accessibilityElement
        accessibilityIdentifier = accessibilityId
    }
}
