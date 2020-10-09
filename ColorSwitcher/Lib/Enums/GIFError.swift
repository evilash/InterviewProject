//
//  GIFError.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import Foundation

enum GIFError: String, Error {
    case urlIsNil = "Sorry, but we can't find your GIF. Please try again later."
    case networkError = "Please connect to the internet and try again."
}
