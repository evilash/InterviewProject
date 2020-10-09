//
//  GIFViewController.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 9/28/20.
//

import UIKit

class GIFViewController: UIViewController {
    @IBOutlet weak var gifTitle: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var gifQueryTextField: UITextField!
    
    var manager = GIFManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    @IBAction func gifMeTapped(_ sender: UIButton) {
        let queryString = gifQueryTextField.text ?? "fun"
        
        manager.fetchGIF(from: queryString) { result in
            switch result {
            case .success(let title):
                let gifTitle = title.isEmpty ? "an empty string" : title
                print("The GIF title is \(gifTitle)")
            case .failure(let error):
                DispatchQueue.main.async {
                    Alert.create(withTitle: "Uh Oh!", message: error.rawValue, vc: self)
                }
            }
        }
    }
    
    func setup() {
        title = "Gif View"
        
        manager.delegate = self
    }

}
