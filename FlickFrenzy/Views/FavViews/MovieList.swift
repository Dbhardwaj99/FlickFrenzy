//
//  MovieList.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import SwiftUI

struct MovieList: View {
    let movie : userFav
    var body: some View {
        HStack(spacing: -5){
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.movieDetail.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125, height: 150)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .cornerRadius(20)
            .frame(width: 125, height: 150)
            .clipped()
            
            Spacer()
            VStack{
                Spacer()
                HStack{
                    Text(movie.movieDetail.title)
                        .font(.system(size: 25))
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Spacer()
                }
                .padding(.horizontal)
                Spacer()
                HStack{
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.yellow)
                    Text("\(movie.movieDetail.voteAverage, specifier: "%.2f")")
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    Image(systemName: "eye.fill")
                    Text(convertToKs(number: movie.movieDetail.voteCount))
                    
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(height: 150)
//        .padding(.all, 10)
//        .frame(maxWidth: .infinity)
        .background(Color.clear)
        .cornerRadius(20)
    }
}

#Preview {
    MovieList(movie: mockUserFav)
}
