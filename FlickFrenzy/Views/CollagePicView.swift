//
//  CollagePicView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct CollagePicView: View {
    let movies: [MovieDetail]
    var body: some View {
        VStack{
            ForEach(movies){ movie in
                AsyncImage(url: URL(string:
                                    ("https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")"))) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Rectangle())
                                    .cornerRadius(15)
                            } placeholder: {
                                Rectangle()
                                    .foregroundColor(.secondary)
                            }
                            .frame(width: 210, height: 300)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("BGColor"))
        .rotationEffect(.degrees(-30))
    }
}

#Preview {
    CollagePicView(movies: mockMovieArray)
}
