//
//  ProjectError.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 10/8/20.
//

import Foundation

enum ProjectError: String, Error {
    case title = "ERROR"
    case gifUrlIsNil = "Sorry, but we can't find your GIF. Please try again later."
    case networkError = "Please connect to the internet and try again."
    case buttonTitleIsNil = "The button title is missing text."
    case technicalDifficulties = "Sorry, but we are having technical difficulties."
}
