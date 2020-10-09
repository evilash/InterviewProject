//
//  GIFManager.swift
//  ColorSwitcher
//
//  Created by Matt M Smith on 9/28/20.
//

import Foundation

protocol GIFManagerDelegate {
    func getGIFModel(title: String, urlString: String)
}

struct GIFManager {
    var delegate: GIFManagerDelegate?
    
    private let apiKey = "0OZKMCWSOD4M"
    private let baseURL = "https://api.tenor.com/v1/search"
    
    func fetchGIF(from query: String, completed: @escaping (Result<String, GIFError>) -> Void) {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        let urlString = "\(baseURL)?key=\(apiKey)&q=\(formattedQuery)&contentfilter=high&media_filter=minimal&limit=1"
        
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, _, error) in
                if let error = error {
                    completed(.failure(.networkError))
                    print(error)
                }
                if let data = data {
                    guard let model = self.parse(jsonData: data) else {
                        completed(.failure(.urlIsNil))
                        return
                    }

                    completed(.success(model.title))
                    self.delegate?.getGIFModel(title: model.title, urlString: model.gifURLString)
                }
            }
            task.resume()
        }
    }
    
    private func parse(jsonData data: Data) -> GIFModel? {
        guard let gifErrorPath = Bundle.main.path(forResource: "error", ofType: "gif") else { return nil }
        
        let decoder = JSONDecoder()
        let decodedData = try? decoder.decode(GIFData.self, from: data)
        let title = decodedData?.results.first?.title ?? "Sorry, but we are having technical Difficulties"
        let gifURLString = decodedData?.results.first?.media.first?.gif.url ?? gifErrorPath
        
        return GIFModel(title: title, gifURLString: gifURLString)
    }
}
