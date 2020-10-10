//
//  GIFViewController.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 9/28/20.
//

import UIKit
import SwiftyGif

class GIFViewController: UIViewController {
    @IBOutlet weak var gifTitle: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var gifQueryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @IBAction func gifMeTapped(_ sender: UIButton) {
        let manager = GIFManager()
        let queryString = gifQueryTextField.text ?? "fun"
        
        manager.fetchGIF(from: queryString) { [weak self] result in
            guard let strongSelf = self else { return }
            
            switch result {
            case .success(let model):
                let title = model.title.isEmpty ? "an empty string" : "\"\(model.title)\""
                
                print("The GIF title is \(title)")
                strongSelf.presentViews(using: model)
            case .failure(let error):
                DispatchQueue.main.async {
                    Alert.create(withTitle: "Uh Oh!", message: error.rawValue, vc: strongSelf)
                }
            }
        }
    }
    
    private func setup() {
        title = "Gif View"
    }
    
    private func presentViews(using model: GIFModel) {
        guard let url = URL(string: model.gifURLString) else {
            let errorMessage = "Sorry, but we are having issues getting your GIF"
            Alert.create(withTitle: "ERROR", message: errorMessage, vc: self)
            
            return
        }
        
        DispatchQueue.main.async {
            self.gifTitle.text = model.title
            self.gifImageView.setGifFromURL(url)
        }
    }
}
