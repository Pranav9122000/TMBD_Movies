//
//  File.swift
//  Domain
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation

public struct MovieListResponse: Codable {
    public let page: Int
    public let results: [MovieEntity]
    public let totalPages: Int
    public let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results, totalPages = "total_pages", totalResults = "total_results"
    }
    
    public init(page: Int, results: [MovieEntity], totalPages: Int, totalResults: Int) {
        self.page = page
        self.results = results
        self.totalPages = totalPages
        self.totalResults = totalResults
    }
}
