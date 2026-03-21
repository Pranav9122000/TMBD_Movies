//
//  File.swift
//  Domain
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation

//      "adult": false,
//      "backdrop_path": "/8YFL5QQVPy3AgrEQxNYVSgiPEbe.jpg",
//      "genre_ids": [
//        28,
//        12,
//        878
//      ],
//      "id": 640146,
//      "original_language": "en",
//      "original_title": "Ant-Man and the Wasp: Quantumania",
//      "overview": "Super-Hero partners Scott Lang and Hope van Dyne, along with with Hope's parents Janet van Dyne and Hank Pym, and Scott's daughter Cassie Lang, find themselves exploring the Quantum Realm, interacting with strange new creatures and embarking on an adventure that will push them beyond the limits of what they thought possible.",
//      "popularity": 9272.643,
//      "poster_path": "/ngl2FKBlU4fhbdsrtdom9LVLBXw.jpg",
//      "release_date": "2023-02-15",
//      "title": "Ant-Man and the Wasp: Quantumania",
//      "video": false,
//      "vote_average": 6.5,
//      "vote_count": 1856

public struct MovieEntity: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let genreIds: [Int]?
    public let id: Int?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String?
    public let voteAverage: Double?
    public let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    public init(adult: Bool?, backdropPath: String?, genreIds: [Int]?, id: Int?, originalLanguage: String?, originalTitle: String?, overview: String?, popularity: Double?, posterPath: String?, releaseDate: String?, title: String?, voteAverage: Double?, voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.genreIds = genreIds
        self.id = id
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.title = title
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}
