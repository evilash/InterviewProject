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
            Alert.display(withMessage: .buttonTitleIsNil, vc: self)
            return
        }
        
        setButtonIsSelectedToFalse()
        
        sender.isSelected = true
        label.textColor = sender.setTextColor
        label.text = "The selected button color is \(buttonText)"
    }
    
    // MARK: - Helper functions
    private func setUp() {
        title = Constants.NavTitle.viewController
        label.text = Constants.Strings.empty
        
        yellowButton.configureButton(buttonTitle: .yellow, accessibilityId: Constants.AccessibilityId.yellowButton)
        blueButton.configureButton(buttonTitle: .blue, accessibilityElement: false, accessibilityId: "blueButton")
        greenButton.configureButton(buttonTitle: .green, accessibilityId: Constants.AccessibilityId.greenButton)
        orangeButton.configureButton(buttonTitle: .orange, accessibilityElement: false)
        indigoButton.configureButton(buttonTitle: .indigo, accessibilityId: Constants.AccessibilityId.indigoButton)
        purpleButton.configureButton(buttonTitle: .purple, accessibilityId: Constants.AccessibilityId.purpleButton)
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
