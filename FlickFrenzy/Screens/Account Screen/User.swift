//
//  User.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import Foundation

struct User: Codable{
    var firstName = ""
    var lastName = ""
    var email = ""
    var address = ""
    var birthday = Date()
    var watchList: [MovieDetailResponse]
    var profileImage: Data?
}

