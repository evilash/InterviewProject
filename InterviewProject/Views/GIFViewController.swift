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
        let query = gifQueryTextField.text ?? "fun"
        let manager = TenorManager(with: query)
        
        manager.fetchModel()
        clearOutSubscriptions()
        
        manager.objectWillChange
            .receive(on: DispatchQueue.main)
            .sink {
                self.displayViews(using: manager.model)
                self.log(title: manager.model.title)
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
        if let url = URL(string: model.url), !model.url.isEmpty {
            self.gifTitle.text = model.title
            self.gifImageView.setGifFromURL(url)
        } else {
            Alert.display(withMessage: .other, vc: self)
        }
    }
    
    private func log(title text: String) {
        let result = text.isEmpty ? "The title is empty" : "the title is '\(text)'"
        
        print(result)
    }
}
