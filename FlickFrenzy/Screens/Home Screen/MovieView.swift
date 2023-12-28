//
//  MovieView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct MovieView: View {
    let movie: MovieDetailResponse = mockMovieDetailResponses
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack(spacing: -5){
                GeometryReader { geometry in
                    AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(height: 650)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    } placeholder: {
                        Rectangle()
                            .foregroundColor(.gray)
                    }
                }.cornerRadius(20)
                .frame(alignment: .top)
                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                .frame(height: 450)
                .clipped()
                
                HStack{
                    Text(movie.title)
                        .font(.system(size: 35))
                        .font(.title)
                        .fontWeight(.bold)
                        .lineLimit(1)
                        .minimumScaleFactor(0.8)
                    Spacer()
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundColor(.yellow)
                    Text("\(movie.voteAverage, specifier: "%.2f")")
                        .foregroundColor(.yellow)
                }
                .padding()
                
                HStack{
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .top) {
                            ForEach(movie.genres) { genre in
                                Text(genre.name)
                                    .font(.caption2)
                                    .fontWeight(.semibold)
                                    .frame(width: 50, height: 30)
                                    .background(Color("ColorPrimary"))
                                    .cornerRadius(15)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(width: 100, height: 30, alignment: .leading)
                }
                
                Spacer()
            }
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
    }
}

#Preview {
    MovieView()
}
