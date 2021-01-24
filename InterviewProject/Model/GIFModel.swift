//
//  DownloadManager.swift
//  InterviewProject
//
//  Created by ms70285 on 1/20/21.
//

import Combine
import Foundation

struct GIFModel {
    typealias GIFTitle = AnyPublisher<String, ProjectError>
    typealias GIFURL = AnyPublisher<URL, ProjectError>
    
    let tenorResponse: NetworkManager.TenorResponsePublisher
    
    init(using query: String) {
        tenorResponse = NetworkManager.fetchGif(from: query)
    }
    
    var title: GIFTitle {
        tenorResponse
            .tryMap { response in
                guard let result = response.results.first else {
                    throw ProjectError.technicalDifficulties
                }
                
                return result.title
            }
            .mapError { ProjectError.map($0) }
            .eraseToAnyPublisher()
    }
    
    var url: GIFURL {
        tenorResponse
            .tryMap { response in
                guard let media = response.results.first?.media.first,
                      let url = URL(string: media.gif.url) else {
                    throw ProjectError.gifUrlIsNil
                }
                
                return url
            }
            .mapError { ProjectError.map($0) }
            .eraseToAnyPublisher()
    }
}
