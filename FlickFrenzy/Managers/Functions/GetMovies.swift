//
//  GetMovies.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

func getMovies(value: Int) async throws -> [MovieDetail] {
    var endpoint = ""
    let topMovies = "https://api.themoviedb.org/3/movie/top_rated?language=en-US&page=1"
    let trendingMovies = "https://api.themoviedb.org/3/trending/movie/day?language=en-US"
    let nowMovies = "https://api.themoviedb.org/3/movie/now_playing?language=en-US&page=1"
    let upComing = "https://api.themoviedb.org/3/movie/upcoming?language=en-US&page=1"
    
    if value == 1{
        endpoint = topMovies
    }else if value == 2{
        endpoint = nowMovies
    }
    else if value == 3{
        endpoint = upComing
    }
    else if value == 4{
        endpoint = trendingMovies
    }
    
    guard let url = URL(string: endpoint) else {
        throw MovieError.invalidURL
    }
    
    var request = URLRequest(url: url)
    request.httpMethod = "GET"
    request.setValue("Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4NjdhYWJmYzQ4ZjA1NzljOTY0MTUzNTNhMWQ4YTY4YSIsInN1YiI6IjY1OGQwNjI1YWUzODQzNmU1MmExNjAwMyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fH_lsEOwFwjchMVnz1vM0GCOBiFsle_ARVgRDfc1wp4", forHTTPHeaderField: "Authorization")
    request.setValue("application/json", forHTTPHeaderField: "accept")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    
    guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
        throw MovieError.invalidResponse
    }
    
    do {
        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        let movies = movieResponse.results
//        processMovies(movies: movies)
        return movies
    } catch {
        print("Decoding error: \(error)")
        throw MovieError.invalidData
    }
}
