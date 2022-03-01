//
//  JSONDecoder+extensions.swift
//  InterviewProject
//
//  Created by Matt M Smith on 2/25/22.
//

import Foundation

extension JSONDecoder {
    func getDecodedData<T: Decodable>(from url: URL?, codableType: T) -> T? {
        guard let url = url,
              let data = try? Data(contentsOf: url),
              let decodedData = try? decode(T.self, from: data) else {
                  return nil
              }
        
        return decodedData
    }
}
