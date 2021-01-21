//
//  DownloadManager.swift
//  InterviewProject
//
//  Created by ms70285 on 1/20/21.
//

import Combine
import Foundation

struct GIFModel {
    let tenorResponse: AnyPublisher<TenorResponse, ProjectError>
    
    init(using query: String) {
        tenorResponse = NetworkManager.fetchGif(from: query)
    }
    
    var title: AnyPublisher<String, ProjectError> {
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
    
    var url: AnyPublisher<URL, ProjectError> {
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
