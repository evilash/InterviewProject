//
//  TenorSetup.swift
//  InterviewProject
//
//  Created by Matt M Smith on 4/29/21.
//

import Foundation

struct TenorSetup {
    private static let apiKey = "ADD API KEY HERE"
    private static let baseURL = "https://api.tenor.com/v1/search"
    private static let filters = "contentfilter=high&media_filter=minimal&limit=1"
    
    static func url(with query: String) -> URL? {
        let formattedQuery = query.replacingOccurrences(of: " ", with: "+")
        
        return URL(string: "\(baseURL)?key=\(apiKey)&q=\(formattedQuery)&\(filters)")
    }
}
