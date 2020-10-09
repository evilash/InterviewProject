//
//  GIFViewController+GIFManagerDelegate.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/5/20.
//

import SwiftyGif
import UIKit

extension GIFViewController: GIFManagerDelegate {
    func getGIFModel(title: String, urlString: String) {
        guard let url = URL(string: urlString) else {
            let errorMessage = "Sorry, but we are having issues getting your GIF"
            Alert.create(withTitle: "ERROR", message: errorMessage, vc: self)
            
            return
        }
        
        DispatchQueue.main.async { [weak self] in
            guard let strongSelf = self else { return }
            
            strongSelf.gifTitle.text = title
            strongSelf.gifImageView.setGifFromURL(url)
        }
    }
}
