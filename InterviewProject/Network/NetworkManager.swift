//
//  GIFManager.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 9/28/20.
//

import Combine
import Foundation

struct NetworkManager {
    typealias TenorResponsePublisher = AnyPublisher<TenorResponse, ProjectError>
    
    static func fetchGif(from query: String) -> TenorResponsePublisher {
        guard let url = Tenor.url(with: query) else {
            return Fail(error: ProjectError.gifUrlIsNil)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { response in
                guard let httpUrlResponse = response.response as? HTTPURLResponse,
                      httpUrlResponse.statusCode == 200 else {
                    throw ProjectError.networkError
                }
                return response.data
            }
            .decode(type: TenorResponse.self, decoder: JSONDecoder())
            .mapError { ProjectError.map($0) }
            .eraseToAnyPublisher()
    }
}
