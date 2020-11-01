//
//  GIFData.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 9/28/20.
//

import Foundation

struct GIFData: Decodable {
    let results: [Results]
}

struct Results: Decodable {
    let title: String
    let media: [Media]
}

struct Media: Decodable {
    let gif: GIF
}

struct GIF: Decodable {
    let url: String
}
