//
//  UserFav.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

struct userFav: Codable, Identifiable, Hashable{
    var id = UUID()
    let movieDetail: MovieDetailResponse
    let castDetail: [CastDetail]
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: userFav, rhs: userFav) -> Bool {
        return lhs.id == rhs.id
    }
}

let mockUserFav = userFav(movieDetail: mockMovieDetailResponses, castDetail: mockCastDetailArray)

let mockUserFavArray : [userFav] = [
    mockUserFav, mockUserFav, mockUserFav
]
