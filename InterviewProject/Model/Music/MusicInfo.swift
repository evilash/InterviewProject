//
//  MusicInfo.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/23/22.
//

import Foundation

struct MusicInfo: Decodable {
    typealias Albums = [Album]
    
    let albums: Albums
    
    init() {
        albums = []
    }
}

struct Album: Decodable {
    let name: String
    let imageName: String
    let artist: String
    let description: String
}
