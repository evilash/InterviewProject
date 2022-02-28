//
//  Alert.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import UIKit

struct Alert {
    static func display(withTitle title: GifError = GifError.title, withMessage message: GifError, vc: UIViewController) {
        let alert = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        let action = UIAlertAction.okButton
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
    
    static func display(withTitle title: MusicError = MusicError.title, withMessage message: MusicError, vc: UIViewController) {
        let alert = UIAlertController(title: title.rawValue, message: message.rawValue, preferredStyle: .alert)
        let action = UIAlertAction.okButton
        alert.addAction(action)
        
        vc.present(alert, animated: true)
    }
}
