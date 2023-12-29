//
//  MovieDetail.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

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

let mockMovieDetail = MovieDetail(
    adult: false,
    backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
    genreIds: [18, 80],
    id: 238,
    originalLanguage: "en",
    originalTitle: "The Godfather",
    overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
    popularity: 148.509,
    posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
    releaseDate: "1972-03-14",
    title: "The Godfather",
    video: false,
    voteAverage: 8.699999999999999,
    voteCount: 19192
)

let mockMovieArray: [MovieDetail] = [
    MovieDetail(
        adult: false,
        backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
        genreIds: [18, 80],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 148.509,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.699999999999999,
        voteCount: 19192
    ),
    MovieDetail(
        adult: false,
        backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
        genreIds: [18, 80],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 148.509,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.699999999999999,
        voteCount: 19192
    ),
    MovieDetail(
        adult: false,
        backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
        genreIds: [18, 80],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 148.509,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.699999999999999,
        voteCount: 19192
    ),
    MovieDetail(
        adult: false,
        backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
        genreIds: [18, 80],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 148.509,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.699999999999999,
        voteCount: 19192
    ),
    MovieDetail(
        adult: false,
        backdropPath: "/u6oXUTtOuJRPdUgUuPAVVJPSKCo.jpg",
        genreIds: [18, 80],
        id: 238,
        originalLanguage: "en",
        originalTitle: "The Godfather",
        overview: "Spanning the years 1945 to 1955, a chronicle of the fictional Italian-American Corleone crime family. When organized crime family patriarch, Vito Corleone barely survives an attempt on his life, his youngest son, Michael steps in to take care of the would-be killers, launching a campaign of bloody revenge.",
        popularity: 148.509,
        posterPath: "/3bhkrj58Vtu7enYsRolD1fZdja1.jpg",
        releaseDate: "1972-03-14",
        title: "The Godfather",
        video: false,
        voteAverage: 8.699999999999999,
        voteCount: 19192
    )
]
