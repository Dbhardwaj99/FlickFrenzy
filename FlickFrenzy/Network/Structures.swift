//
//  Structures.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import Foundation

struct MovieResponse: Codable {
    let page: Int
    let results: [MovieDetail]
    let totalPages: Int
    let totalResults: Int
    
    private enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct MovieDetailResponse: Codable {
    let adult: Bool
    let backdropPath: String?
    let budget: Int
    let genres: [Genre]
    let homepage: String?
    let id: Int
    let imdbId: String?
    let originalLanguage: String
    let originalTitle: String
    let overview: String?
    let popularity: Double
    let posterPath: String?
    let productionCompanies: [ProductionCompany]
    let productionCountries: [ProductionCountry]
    let releaseDate: String?
    let revenue: Int
    let runtime: Int?
    let spokenLanguages: [SpokenLanguage]?
    let status: String
    let tagline: String?
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int

    struct Genre: Codable, Identifiable {
        let id: Int
        let name: String
    }

    struct ProductionCompany: Codable {
        let id: Int
        let logoPath: String?
        let name: String
        let originCountry: String?
    }

    struct ProductionCountry: Codable {
        let iso31661: String?
        let name: String
    }

    struct SpokenLanguage: Codable {
        let englishName: String?
        let iso6391: String?
        let name: String?
    }

    private enum CodingKeys: String, CodingKey {
        case adult, budget, genres, homepage, id, overview, popularity, releaseDate, revenue, runtime, status, tagline, title, video
        case backdropPath = "backdrop_path"
        case imdbId = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case productionCompanies = "production_companies"
        case productionCountries = "production_countries"
        case spokenLanguages = "spoken_languages"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieDetail: Codable, Identifiable {
    let movieid = UUID()
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    
    private enum CodingKeys: String, CodingKey {
        case adult, id, overview, popularity, title, video
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

struct MovieCastResponse: Codable {
    let id: Int
    let cast: [CastDetail]
    
    private enum CodingKeys: String, CodingKey {
        case id, cast
    }
}

struct CastDetail: Codable, Identifiable {
    let adult: Bool
    let gender: Int
    let id: Int
    let knownForDepartment: String
    let name: String
    let originalName: String
    let popularity: Double
    let profilePath: String?
    let castId: Int
    let character: String
    let creditId: String
    let order: Int

    private enum CodingKeys: String, CodingKey {
        case adult, gender, id, name, character, order
        case knownForDepartment = "known_for_department"
        case originalName = "original_name"
        case popularity, profilePath = "profile_path"
        case castId = "cast_id"
        case creditId = "credit_id"
    }
}


enum MovieError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
