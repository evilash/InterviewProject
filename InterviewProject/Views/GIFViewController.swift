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
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setup()
        dismissKeyboardTapGesture()
    }
    
    @IBAction func gifMeTapped(_ sender: UIButton) {
        let query = gifQueryTextField.text ?? Constants.TextField.defaultQuery
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
        title = Constants.NavTitle.gifViewController
        gifQueryTextField.placeholder = Constants.TextField.placeholder
    }
    
    private func clearOutSubscriptions() {
        subscriptions = []
        subscriptions.forEach { $0.cancel() }
    }
    
    private func displayViews(using model: GIFModel) {
        guard let url = URL(string: model.url), !model.url.isEmpty else {
            gifTitle.text = Constants.GifTitle.techDifficulties
            gifImageView.image = UIImage(named: Constants.Image.standy)
            log(title: Constants.GifTitle.techDifficulties)
            return
        }
        
        gifTitle.text = model.title
        gifImageView.setGifFromURL(url)
    }
    
    private func log(title text: String) {
        let result = text.isEmpty ? Constants.GifTitle.emptyTitle : "the title is \"\(text)\""
        
        print(result)
    }
}
