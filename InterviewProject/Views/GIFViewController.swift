//
//  GIFViewController.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 9/28/20.
//

import Combine
import SwiftyGif
import UIKit

class GIFViewController: UIViewController {
    private var subscriptions = Set<AnyCancellable>()
    
    @IBOutlet weak var gifTitle: UILabel!
    @IBOutlet weak var gifImageView: UIImageView!
    @IBOutlet weak var gifQueryTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        dismissKeyboardTapGesture()
    }
    
    @IBAction func gifMeTapped(_ sender: UIButton) {
        let queryString = gifQueryTextField.text ?? "fun"
        let gif = GIFManager.fetchGif(from: queryString)
        clearOutSubscriptions()
        
        gif.receive(on: DispatchQueue.main)
            .sink {
                switch $0 {
                case .finished: break
                case .failure(let error):
                    Alert.create(withMessage: error, vc: self)
                }
            } receiveValue: { model in
                self.displayViews(using: model)
            }
            .store(in: &subscriptions)
    }
    
    //MARK: - Helper Functions
    private func setup() {
        title = "Gif View"
        gifQueryTextField.placeholder = "Enter text"
    }
    
    private func clearOutSubscriptions() {
        subscriptions = []
        subscriptions.forEach { $0.cancel() }
    }
    
    private func displayViews(using model: GIFModel) {
        guard let url = URL(string: model.urlString) else {
            Alert.create(withMessage: .networkError, vc: self)
            return
        }
        
        self.gifTitle.text = model.title
        self.gifImageView.setGifFromURL(url)
    }
}
