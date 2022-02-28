//
//  TextFieldTestViewController.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/25/20.
//

import UIKit

class TextFieldTestViewController: UIViewController {
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        dismissKeyboardTapGesture()
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        // Artist of image is Alex Solis
        imageView.image = UIImage(named: Constants.Image.thanos)
    }
    
    // MARK: - Helper function
    private func setUp() {
        submitButton.isEnabled = false
        textField.delegate = self
        textField.backgroundColor = .setBackgroundColor
        imageView.accessibilityIdentifier = Constants.AccessibilityId.snap
        textField.accessibilityIdentifier = Constants.AccessibilityId.textField
        submitButton.accessibilityIdentifier = Constants.AccessibilityId.submitButton
    }
    
}
