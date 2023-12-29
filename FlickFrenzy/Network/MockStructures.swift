//
//  MockStructures.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import Foundation

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



let mockCastDetailArray: [CastDetail] = [
    CastDetail(adult: false,
               gender: 2,
               id: 819,
               knownForDepartment: "Acting",
               name: "Edward Norton",
               originalName: "Edward Norton",
               popularity: 26.99,
               profilePath: "/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg",
               castId: 4,
               character: "The Narrator",
               creditId: "52fe4250c3a36847f80149f3",
               order: 0
              ),
    CastDetail(adult: false, gender: 2, id: 287, knownForDepartment: "Acting", name: "Brad Pitt", originalName: "Brad Pitt", popularity: 45.202, profilePath: "/huV2cdcolEUwJy37QvH914vup7d.jpg", castId: 5, character: "Tyler Durden", creditId: "52fe4250c3a36847f80149f7", order: 1)
]

let mockCastDetail = CastDetail(adult: false, gender: 2, id: 819, knownForDepartment: "Acting", name: "Edward Norton", originalName: "Edward Norton", popularity: 26.99, profilePath: "/8nytsqL59SFJTVYVrN72k6qkGgJ.jpg", castId: 4, character: "The Narrator", creditId: "52fe4250c3a36847f80149f3", order: 0)
