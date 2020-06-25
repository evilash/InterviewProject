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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtons()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
    }

    private func setUpButtons() {
        yellowButton.titleLabel?.text = "Yellow"
        yellowButton.accessibilityIdentifier = "yellowButton"
        
        blueButton.titleLabel?.text = "Blue"
        blueButton.isAccessibilityElement = false
        blueButton.accessibilityIdentifier = "blueButton"
        
        greenButton.titleLabel?.text = "Green"
        greenButton.accessibilityIdentifier = "greenButton"
        
        orangeButton.titleLabel?.text = "Orange"
        orangeButton.isAccessibilityElement = false
        
        indigoButton.titleLabel?.text = "Indigo"
        indigoButton.accessibilityIdentifier = "indigoButton"
        
        purpleButton.titleLabel?.text = "Purple"
        purpleButton.accessibilityIdentifier = "pButton"
    }

}

