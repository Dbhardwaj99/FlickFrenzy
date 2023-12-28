//
//  HomeScreenViews.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct HomeScreenViews: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    columnView(columnTitle: "popular", intwidthh: 200, movies: mockMovieArray)
}

struct Header: View {
    var body: some View {
        HStack(spacing: 20){
            Image(systemName: "person.circle.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50, alignment: .leading)
            VStack(alignment: .leading){
                Text("Welcome back,")
                Text("Divyansh Bhardwaj")
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
            Image(systemName: "bell.badge.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40, alignment: .trailing)
        }
        .padding(.all)
    }
}

struct columnView: View {
    let columnTitle: String
    let intwidthh: CGFloat
    let movies: [MovieDetail]
    
    var body: some View {
        VStack {
            HStack{
                Text(columnTitle)
                    .font(.title)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                Spacer()
                Text("See all")
                    .font(.caption)
                    .fontWeight(.semibold)
                    .underline()
            }
            .padding(.horizontal)
            .padding(.top)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(movies) { movie in
                        MoviePreView(intwidthh: intwidthh, movie: movie)
                            .id(movie.movieid)
                    }
                }
                .frame(height: 200)
                .padding(.horizontal)
            }
        }
    }
}
