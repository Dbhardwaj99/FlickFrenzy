//
//  Reponse.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

struct MovieCastResponse: Codable {
    let id: Int
    let cast: [CastDetail]
    
    private enum CodingKeys: String, CodingKey {
        case id, cast
    }
}

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


let mockMovieDetailResponses = MovieDetailResponse(
        adult: false,
        backdropPath: "/hZkgoQYus5vegHoetLkCJzb17zJ.jpg",
        budget: 63000000,
        genres: [
            MovieDetailResponse.Genre(id: 18, name: "Drama"),
            MovieDetailResponse.Genre(id: 53, name: "Thriller"),
            MovieDetailResponse.Genre(id: 35, name: "Comedy")
        ],
        homepage: "http://www.foxmovies.com/movies/fight-club",
        id: 550,
        imdbId: "tt0137523",
        originalLanguage: "en",
        originalTitle: "Fight Club",
        overview: "A ticking-time-bomb insomniac and a slippery soap salesman channel primal male aggression into a shocking new form of therapy. Their concept catches on, with underground \"fight clubs\" forming in every town, until an eccentric gets in the way and ignites an out-of-control spiral toward oblivion.",
        popularity: 61.416,
        posterPath: "/pB8BM7pdSp6B6Ih7QZ4DrQ3PmJK.jpg",
        productionCompanies: [
            MovieDetailResponse.ProductionCompany(id: 508, logoPath: "/7cxRWzi4LsVm4Utfpr1hfARNurT.png", name: "Regency Enterprises", originCountry: "US"),
            MovieDetailResponse.ProductionCompany(id: 711, logoPath: "/tEiIH5QesdheJmDAqQwvtN60727.png", name: "Fox 2000 Pictures", originCountry: "US"),
        ],
        productionCountries: [
            MovieDetailResponse.ProductionCountry(iso31661: "US", name: "United States of America")
        ],
        releaseDate: "1999-10-15",
        revenue: 100853753,
        runtime: 139,
        spokenLanguages: [
            MovieDetailResponse.SpokenLanguage(englishName: "English", iso6391: "en", name: "English")
        ],
        status: "Released",
        tagline: "Mischief. Mayhem. Soap.",
        title: "Fight Club",
        video: false,
        voteAverage: 8.433,
        voteCount: 26280
)
