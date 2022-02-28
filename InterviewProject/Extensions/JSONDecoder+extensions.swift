//
//  JSONDecoder+extensions.swift
//  InterviewProject
//
//  Created by Matt M Smith on 2/25/22.
//

import Foundation

extension JSONDecoder {
    func getMusicInfo() -> MusicInfo? {
        guard let url = Music.url,
              let data = try? Data(contentsOf: url),
              let musicInfo = try? decode(MusicInfo.self, from: data) else {
                  return nil
              }
        
        return musicInfo
    }
}
