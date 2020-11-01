//
//  TextFieldTestViewController+UITextFieldDelegate.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/25/20.
//

import Foundation
import UIKit

extension TextFieldTestViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let text = textField.text else { return false }
        let buttonState = text.count >= 4 ? true : false
        
        submitButton.isEnabled = buttonState
        partThreeButton.isHidden = !buttonState
        
        return true
    }
}
