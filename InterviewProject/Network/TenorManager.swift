//
//  TenorManager.swift
//  InterviewProject
//
//  Created by Matt Smith on 2/1/21.
//

import Combine
import Foundation

class TenorManager: ObservableObject {
    @Published var model: GIFModel
    
    private let response: NetworkManager.TenorResponsePublisher
    private var cancellable: AnyCancellable?
    
    init(with query: String) {
        response = NetworkManager.fetchGif(from: query)
        model = GIFModel(title: Constants.Strings.empty, url: Constants.Strings.empty)
    }
    
    func fetchModel() {
        cancellable = nil
        
        cancellable = response
            .sink { completion in
                switch completion {
                case .finished: break
                case .failure(let error):
                    Alert.display(withMessage: error, vc: GIFViewController())
                }
            } receiveValue: { response in
                let results = response.results.first
                let title = results?.title ?? Constants.Strings.empty
                let url = results?.media.first?.gif.url ?? Constants.Strings.empty
                self.model = GIFModel(title: title, url: url)
            }
    }
}
