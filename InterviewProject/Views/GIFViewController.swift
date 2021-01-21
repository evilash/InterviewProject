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
        let gif = GIFModel(using: query)
        let title = gif.title
        let url = gif.url
        
        clearOutSubscriptions()
        title.zip(url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    Alert.create(withMessage: error, vc: self)
                }
            } receiveValue: { (title, url) in
                let printTitle = title.isEmpty ? "an empty string" : "'\(title)'"

                print("The title is \(printTitle)")
                self.displayViews(using: title, url: url)
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
    
    private func displayViews(using title: String, url: URL) {
        self.gifTitle.text = title
        self.gifImageView.setGifFromURL(url)
    }
}
