//
//  SeeMoreList.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 30/12/23.
//

import SwiftUI

struct SeeMoreList: View {
    let movie : MovieDetail
    var body: some View {
        HStack(spacing: -5){
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 125, height: 150)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .cornerRadius(15)
            .frame(width: 125, height: 150)
            .clipped()
            
            Spacer()
            VStack{
                Spacer()
                HStack{
                    Text(movie.title)
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
                    Text("\(movie.voteAverage, specifier: "%.2f")")
                        .foregroundColor(.yellow)
                    
                    Spacer()
                    
                    Image(systemName: "eye.fill")
                    Text(convertToKs(number: movie.voteCount))
                    
                }
                .padding(.horizontal)
                Spacer()
            }
        }
        .foregroundColor(.white)
        .frame(height: 150)
        .padding(.all, 10)
        .frame(maxWidth: .infinity)
        .background(Color("ColorPrimary"))
        .cornerRadius(15)
    }
}

#Preview {
    SeeMoreList(movie: mockMovieDetail)
}
