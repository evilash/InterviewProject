//
//  UIViewController+extension.swift
//  InterviewProject
//
//  Created by Matt M Smith on 12/6/20.
//

import UIKit

extension UIViewController {
    func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(view.endEditing))
        view.addGestureRecognizer(tap)
    }
}
