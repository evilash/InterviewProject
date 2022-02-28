//
//  MusicManager.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/24/22.
//

import Foundation

struct MusicManager {
    let manager: DataManager
    let albums: MusicInfo.Albums?
    
    init() {
        manager = DataManager()
        albums = manager.fetchAlbumInfo()
    }
    
}
