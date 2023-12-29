//
//  GetMovieDetails.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

func getMovieDetail(value: Int) async throws -> MovieDetailResponse {
    let endpoint = "https://api.themoviedb.org/3/movie/\(value)?language=en-US"
    
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
        let movieResponse = try JSONDecoder().decode(MovieDetailResponse.self, from: data)
        return movieResponse
    } catch {
        print("Decoding error: \(error)")
        throw MovieError.invalidData
    }
}
