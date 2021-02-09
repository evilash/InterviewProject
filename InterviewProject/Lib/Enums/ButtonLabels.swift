//
//  ButtonLabels.swift
//  ColorSwitcher
//
//  Created by Matt Smith on 6/25/20.
//

import UIKit

enum ButtonLabels: String, Identifiable {
    case yellow
    case blue
    case green
    case orange
    case indigo
    case purple
    var id: String { self.rawValue }
}
