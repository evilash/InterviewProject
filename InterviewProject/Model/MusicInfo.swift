//
//  MusicInfo.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/23/22.
//

import Foundation

/*
    I got the description info in the json file from wikipedia.
    I'm just wanting to give credit where it is due.
*/

struct MusicInfo: Decodable {
    typealias Albums = [Album]
    
    let albums: Albums
}

struct Album: Decodable {
    let name: String
    let imageName: String
    let artist: String
    let description: String
}
