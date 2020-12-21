//
//  ViewController.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/24/20.
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
            Alert.create(withMessage: .buttonTitleIsNil, vc: self)
            return
        }
        
        setButtonIsSelectedToFalse()
        
        sender.isSelected = true
        label.textColor = sender.setTextColor
        label.text = "The selected button color is \(buttonText)"
    }
    
    // MARK: - Helper functions
    private func setUp() {
        title = "Color Switch"
        label.text = ""
        
        yellowButton.configureButton(buttonTitle: ButtonLabels.yellow, accessibilityId: "yellowButton")
        blueButton.configureButton(buttonTitle: ButtonLabels.blue, accessibilityElement: false, accessibilityId: "blueButton")
        greenButton.configureButton(buttonTitle: ButtonLabels.green, accessibilityId: "greenButton")
        orangeButton.configureButton(buttonTitle: ButtonLabels.orange, accessibilityElement: false)
        indigoButton.configureButton(buttonTitle: ButtonLabels.indigo, accessibilityId: "indigoButton")
        purpleButton.configureButton(buttonTitle: ButtonLabels.purple, accessibilityId: "pButton")
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
