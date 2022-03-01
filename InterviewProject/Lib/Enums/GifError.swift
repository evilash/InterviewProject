//
//  GifError.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import Foundation

enum GifError: String, Error {
    case title = "ERROR"
    case urlIsNil = "Sorry, but we can't find your GIF. Please try again later."
    case networkError = "Please connect to the internet and try again."
    case other = "Please try again later."
    
    static func map(_ error: Error) -> GifError {
      return (error as? GifError) ?? .other
    }
}
