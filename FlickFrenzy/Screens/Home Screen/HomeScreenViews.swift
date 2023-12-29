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
    castColumnView(casts: mockCastDetailArray)
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
    @ObservedObject var viewModel: HomeViewModel
    let movieArray: [MovieDetail]
    
    var body: some View {
        VStack {
            topicHeader(title: columnTitle)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(movieArray) { movie in
                        MoviePreView(intwidthh: intwidthh, movie: movie)
                            .id(movie.movieid)
                            .onTapGesture {
                                viewModel.selectedMovieId = movie.id
                                viewModel.isMovieViewActive = true
                                Task {
                                    await viewModel.fetchMoviesAndDetails()
                                }
                            }
                    }
                }
                .frame(height: 200)
                .padding(.horizontal)
            }
        }
    }
}

struct castColumnView: View {
    let casts: [CastDetail]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(casts) { cast in
                        CastPreView(cast: cast)
                            .id(cast.id)
                    }
                }
                .frame(height: 300)
                .padding(.horizontal)
            }
        }
    }
}

struct topicHeader: View {
    var title: String
    var body: some View {
        HStack{
            Text(title)
                .font(.title2)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
            Spacer()
            Text("See all")
                .font(.caption)
                .fontWeight(.semibold)
                .underline()
        }
        .padding(.horizontal)
        .padding(.top)
    }
}
