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
    }
    
    @IBAction func submitPressed(_ sender: UIButton) {
        textField.resignFirstResponder()
        
        // Artist of image is Alex Solis
        imageView.image = UIImage(named: "thanos")
    }
    
    // MARK: - Helper function
    private func setUp() {
        submitButton.isEnabled = false
        textField.delegate = self
        
        imageView.accessibilityIdentifier = "snap"
        textField.accessibilityIdentifier = "textField"
        submitButton.accessibilityIdentifier = "submitButton"
    }
    
}
