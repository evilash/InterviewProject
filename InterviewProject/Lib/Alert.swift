//
//  Alert.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import Foundation
import UIKit

struct Alert {
    static func create(withTitle title: String, message: ProjectError, vc: UIViewController) {
        let alert = UIAlertController(title: title, message: message.rawValue, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
}
