//
//  File.swift
//  Domain
//
//  Created by Pranav.kulkarni on 21/03/26.
//

import Foundation

//  "adult": false,
//  "backdrop_path": "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
//  "belongs_to_collection": null,
//  "budget": 63000000,
//  "genres": [
//    {
//      "id": 18,
//      "name": "Drama"
//    },
//    {
//      "id": 53,
//      "name": "Thriller"
//    },
//    {
//      "id": 35,
//      "name": "Comedy"
//    }
//  ],
//  "homepage": "http://www.foxmovies.com/movies/fight-club",
//  "id": 550,
//  "imdb_id": "tt0137523",
//  "original_language": "en",
//  "original_title": "Fight Club",
//  "overview": "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
//  "popularity": 61.416,
//  "poster_path": "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
//  "production_companies": [
//    {
//      "id": 508,
//      "logo_path": "/7cxRWzi4LsVm4Utfpr1hfARNurT.png",
//      "name": "Regency Enterprises",
//      "origin_country": "US"
//    },
//    {
//      "id": 711,
//      "logo_path": "/tEiIH5QesdheJmDAqQwvtN60727.png",
//      "name": "Fox 2000 Pictures",
//      "origin_country": "US"
//    },
//    {
//      "id": 20555,
//      "logo_path": "/hD8yEGUBlHOcfHYbujp71vD8gZp.png",
//      "name": "Taurus Film",
//      "origin_country": "DE"
//    },
//    {
//      "id": 54051,
//      "logo_path": null,
//      "name": "Atman Entertainment",
//      "origin_country": ""
//    },
//    {
//      "id": 54052,
//      "logo_path": null,
//      "name": "Knickerbocker Films",
//      "origin_country": "US"
//    },
//    {
//      "id": 4700,
//      "logo_path": "/A32wmjrs9Psf4zw0uaixF0GXfxq.png",
//      "name": "The Linson Company",
//      "origin_country": "US"
//    },
//    {
//      "id": 25,
//      "logo_path": "/qZCc1lty5FzX30aOCVRBLzaVmcp.png",
//      "name": "20th Century Fox",
//      "origin_country": "US"
//    }
//  ],
//  "production_countries": [
//    {
//      "iso_3166_1": "US",
//      "name": "United States of America"
//    }
//  ],
//  "release_date": "1999-10-15",
//  "revenue": 100853753,
//  "runtime": 139,
//  "spoken_languages": [
//    {
//      "english_name": "English",
//      "iso_639_1": "en",
//      "name": "English"
//    }
//  ],
//  "status": "Released",
//  "tagline": "Mischief. Mayhem. Soap.",
//  "title": "Fight Club",
//  "video": false,
//  "vote_average": 8.433,
//  "vote_count": 26280

public struct MovieDetailsEntity: Codable, Identifiable {
    public let adult: Bool?
    public let backdropPath: String?
    public let budget: Int?
    public let genres: [Genre]?
    public let homepage: String?
    public let id: Int?
    public let imdbId: String?
    public let originalLanguage: String?
    public let originalTitle: String?
    public let overview: String?
    public let popularity: Double?
    public let posterPath: String?
    public let productionCompanies: [ProductionCompany]?
    public let productionCountries: [ProductionCountry]?
    public let releaseDate: String?
    public let revenue: Int?
    public let runtime: Int?
    public let spokenLanguages: [SpokenLanguage]?
    public let status: String?
    public let tagline: String?
    public let title: String?
    public let video: Bool?
    public let voteAverage: Double?
    public let voteCount: Int?
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget
        case genres
        case homepage
        case id
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case popularity
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue
        case runtime
        case spokenLanguages = "spoken_languages"
        case status
        case tagline
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }

    public init(adult: Bool?, backdropPath: String?, budget: Int?, genres: [Genre]?, homepage: String?, id: Int?, imdbId: String?, originalLanguage: String?, originalTitle: String?, overview: String?, popularity: Double?, posterPath: String?, productionCompanies: [ProductionCompany]?, productionCountries: [ProductionCountry]?, releaseDate: String?, revenue: Int?, runtime: Int?, spokenLanguages: [SpokenLanguage]?, status: String?, tagline: String?, title: String?, video: Bool?, voteAverage: Double?, voteCount: Int?) {
        self.adult = adult
        self.backdropPath = backdropPath
        self.budget = budget
        self.genres = genres
        self.homepage = homepage
        self.id = id
        self.imdbId = imdbId
        self.originalLanguage = originalLanguage
        self.originalTitle = originalTitle
        self.overview = overview
        self.popularity = popularity
        self.posterPath = posterPath
        self.productionCompanies = productionCompanies
        self.productionCountries = productionCountries
        self.releaseDate = releaseDate
        self.revenue = revenue
        self.runtime = runtime
        self.spokenLanguages = spokenLanguages
        self.status = status
        self.tagline = tagline
        self.title = title
        self.video = video
        self.voteAverage = voteAverage
        self.voteCount = voteCount
    }
}

// MARK: - Sub-Models

public struct Genre: Codable, Identifiable {
    public let id: Int?
    public let name: String?
    
    public init(id: Int?, name: String?) {
        self.id = id
        self.name = name
    }
}

public struct ProductionCompany: Codable, Identifiable {
    public let id: Int?
    public let logoPath: String?
    public let name: String?
    public let originCountry: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case logoPath = "logo_path"
        case name
        case originCountry = "origin_country"
    }
    
    public init(id: Int?, logoPath: String?, name: String?, originCountry: String?) {
        self.id = id
        self.logoPath = logoPath
        self.name = name
        self.originCountry = originCountry
    }
}

public struct ProductionCountry: Codable {
    public let iso3166_1: String?
    public let name: String?
    
    enum CodingKeys: String, CodingKey {
        case iso3166_1 = "iso_3166_1"
        case name
    }
    
    public init(iso3166_1: String?, name: String?) {
        self.iso3166_1 = iso3166_1
        self.name = name
    }
}

public struct SpokenLanguage: Codable {
    public let englishName: String?
    public let iso639_1: String?
    public let name: String?
    
    enum CodingKeys: String, CodingKey {
        case englishName = "english_name"
        case iso639_1 = "iso_639_1"
        case name
    }
    
    public init(englishName: String?, iso639_1: String?, name: String?) {
        self.englishName = englishName
        self.iso639_1 = iso639_1
        self.name = name
    }
}
