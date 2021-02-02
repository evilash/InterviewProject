//
//  Alert.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import UIKit

struct Alert {
    static func display(withTitle title: ProjectError = ProjectError.title, withMessage message: ProjectError, vc: UIViewController) {
        let alert = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
}
