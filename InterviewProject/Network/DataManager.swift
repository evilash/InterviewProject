//
//  DataManager.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 9/28/20.
//

import Combine
import Foundation

struct DataManager {
    typealias TenorResponsePublisher = AnyPublisher<TenorResponse, GifError>
    
    static func fetchGif(from query: String) -> TenorResponsePublisher {
        guard let url = Tenor.url(with: query) else {
            return Fail(error: GifError.urlIsNil)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { response in
                guard let httpUrlResponse = response.response as? HTTPURLResponse,
                      httpUrlResponse.statusCode == 200 else {
                          throw GifError.networkError
                      }
                return response.data
            }
            .decode(type: TenorResponse.self, decoder: JSONDecoder())
            .mapError { GifError.map($0) }
            .eraseToAnyPublisher()
    }
    
    func fetchAlbumInfo() -> MusicInfo.Albums? {
        let decoder = JSONDecoder()
        let musicInfo = decoder.getMusicInfo()
        
        return musicInfo?.albums
    }
}
