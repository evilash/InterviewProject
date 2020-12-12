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
    @IBOutlet weak var partThreeButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
        dismissKeyboardTapGesture()
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        // Artist of image is Alex Solis
        imageView.image = UIImage(named: "thanos")
    }
    
    // MARK: - Helper function
    private func setUp() {
        title = "Snap!"
        submitButton.isEnabled = false
        partThreeButton.isHidden = true
        textField.delegate = self
        imageView.accessibilityIdentifier = "snap"
        textField.accessibilityIdentifier = "textField"
        submitButton.accessibilityIdentifier = "submitButton"
    }
    
}
