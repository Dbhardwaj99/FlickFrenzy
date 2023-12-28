//
//  HomeView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText = ""
    @State var topMovies: [MovieDetail] = []
    @State var nowMovies: [MovieDetail] = []
    @State var upcomingMovies: [MovieDetail] = []
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                HStack(spacing: 5){
                    
                }
                ScrollView{
                    Header()
                    HStack {
                        TextField("Search", text: $searchText)
                            .foregroundStyle(Color.white)
                            .font(.system(size: 16, weight: .bold))
                        if searchText.isEmpty{
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                        }else{
                            Image(systemName: "xmark.circle.fill")
                                .foregroundColor(.white)
                                .onTapGesture {
                                    searchText = ""
                                }
                        }
                    }
                    .frame(width: 325)
                    .padding()
                    .background(Color("ColorPrimary"))
                    .cornerRadius(15)
                    
                    columnView(columnTitle: "Now in Cinema", intwidthh: 170, movies: nowMovies)
                    columnView(columnTitle: "Trending", intwidthh: 300, movies: topMovies)
                    columnView(columnTitle: "Upcoming", intwidthh: 300, movies: upcomingMovies)
                }
                .padding(.top, 2)
            }
            .task {
                do{
                    topMovies = try await getMovies(value: 4)
                    nowMovies = try await getMovies(value: 2)
                    upcomingMovies = try await getMovies(value: 3)
                    //                        movies = mockMovieArray
                }  catch {
                    print("Error fetching movies: \(error)")
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
    }
}

#Preview {
    HomeView()
}


