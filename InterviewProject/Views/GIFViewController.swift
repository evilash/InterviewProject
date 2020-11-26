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
                    Alert.create(withMessage: error, vc: strongSelf)
                }
            }
        }
    }
    
    //MARK: - Helper Functions
    private func setup() {
        title = "Gif View"
        gifQueryTextField.placeholder = "Enter text"
    }
    
    private func presentViews(using model: GIFModel) {
        guard let url = URL(string: model.urlString) else {
            Alert.create(withMessage: .networkError, vc: self)
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.gifTitle.text = model.title
            strongSelf.gifImageView.setGifFromURL(url)
        }
    }
}
