//
//  ViewController.swift
//  ColorSwitcher
//
//  Created by ms70285 on 6/24/20.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var indigoButton: UIButton!
    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonText = sender.titleLabel?.text else {
            let errorMessage = "The button is missing text"
            let alert = UIAlertController(title: "ERROR", message: errorMessage, preferredStyle: .alert)
            let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alert.addAction(action)
            
            present(alert, animated: true)
            return
        }
        
        setButtonIsSelectedToFalse()
        
        sender.isSelected = true
        label.textColor = sender.setTextColor
        label.text = "The selected button color is \(buttonText)"
        
    }
    
    // MARK: - Helper functions
    private func setUp() {
        label.text = ""
        
        yellowButton.setTitle(ButtonLabels.yellow, for: .normal)
        yellowButton.accessibilityIdentifier = "yellowButton"
        
        blueButton.setTitle(ButtonLabels.blue, for: .normal)
        blueButton.isAccessibilityElement = false
        blueButton.accessibilityIdentifier = "blueButton"
        
        greenButton.setTitle(ButtonLabels.green, for: .normal)
        greenButton.accessibilityIdentifier = "greenButton"
        
        orangeButton.setTitle(ButtonLabels.orange, for: .normal)
        orangeButton.isAccessibilityElement = false
        
        indigoButton.setTitle(ButtonLabels.indigo, for: .normal)
        indigoButton.accessibilityIdentifier = "indigoButton"
        
        purpleButton.setTitle(ButtonLabels.purple, for: .normal)
        purpleButton.accessibilityIdentifier = "pButton"
    }
    
    private func setButtonIsSelectedToFalse() {
        yellowButton.isSelected = false
        blueButton.isSelected = false
        greenButton.isSelected = false
        orangeButton.isSelected = false
        indigoButton.isSelected = false
        purpleButton.isSelected = false
    }
    
}

