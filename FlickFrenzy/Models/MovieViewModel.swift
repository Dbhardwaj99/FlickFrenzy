//
//  MovieViewModel.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var trendingMovies: [MovieDetail] = []
    @Published var topMovies: [MovieDetail] = []
    @Published var nowMovies: [MovieDetail] = []
    @Published var upcomingMovies: [MovieDetail] = []
    @Published var movie: MovieDetailResponse?
    @Published var movieCast: [CastDetail] = []
    
    @Published var searchText: String = ""
    @Published var movieId: Int = 282
    @Published var isMovieViewActive: Bool = false
    
    @Published var isSeeMore: Bool = false
    @Published var columnTitle: String = "🍿Movies"
    @Published var movieArray: [MovieDetail] = []
    
    
    @Published var selectedMovieId: Int?
    
    
    init() {
            // Initialize any properties or setup code here if needed.
            searchText = ""
        }

    func fetchMoviesAndDetails() async {
        do {
            let movies = try await getMovies(value: 4)
            DispatchQueue.main.async {
                self.trendingMovies = movies
            }

            let top = try await getMovies(value: 1)
            DispatchQueue.main.async {
                self.topMovies = top
            }

            let now = try await getMovies(value: 2)
            DispatchQueue.main.async {
                self.nowMovies = now
            }

            let upcoming = try await getMovies(value: 3)
            DispatchQueue.main.async {
                self.upcomingMovies = upcoming
            }

            // Assuming movieId is set elsewhere or passed when needed
            let detail = try await getMovieDetail(value: selectedMovieId ?? 238)
            DispatchQueue.main.async {
                self.movie = detail
            }

            let cast = try await getMovieCast(value: selectedMovieId ?? 238)
            DispatchQueue.main.async {
                self.movieCast = cast
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
