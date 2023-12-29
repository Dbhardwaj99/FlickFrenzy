//
//  CastDetail.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

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
let mockCastDetail = CastDetail(
    adult: false,
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
)

let mockCastDetailArray: [CastDetail] = [
    CastDetail(
        adult: false,
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
    CastDetail(
        adult: false,
        gender: 2,
        id: 287,
        knownForDepartment: "Acting",
        name: "Brad Pitt",
        originalName: "Brad Pitt",
        popularity: 45.202,
        profilePath: "/huV2cdcolEUwJy37QvH914vup7d.jpg",
        castId: 5,
        character: "Tyler Durden",
        creditId: "52fe4250c3a36847f80149f7",
        order: 1
    )
]
