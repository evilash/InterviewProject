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
    
    private let response: DataManager.TenorResponsePublisher
    private var cancellable: AnyCancellable?
    
    init(with query: String) {
        response = DataManager.fetchGif(from: query)
        model = GIFModel()
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
                let result = response.results.first
                let title = result?.title
                let url = result?.media.first?.gif.url
                self.model = GIFModel(title: title, url: url)
            }
    }
}
