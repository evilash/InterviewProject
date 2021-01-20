//
//  Tenor.swift
//  InterviewProject
//
//  Created by Matt Smith on 1/19/21.
//

import Foundation

struct Tenor {
    private static let apiKey = "0OZKMCWSOD4M"
    private static let baseURL = "https://api.tenor.com/v1/search"
    private static let filters = "contentfilter=high&media_filter=minimal&limit=1"
    
    static func url(with query: String) -> URL? {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        
        return URL(string: "\(baseURL)?key=\(apiKey)&q=\(formattedQuery)&\(filters)")
    }
}
