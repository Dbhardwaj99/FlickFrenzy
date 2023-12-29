//
//  HomeView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    @State var searchText: String = ""
    
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
                    

                    columnView(columnTitle: "Now in Cinema",
                               intwidthh: 170,
                               viewModel: viewModel,
                               movieArray: viewModel.nowMovies)
                    
                    columnView(columnTitle: "Trending",
                               intwidthh: 300,
                               viewModel: viewModel,
                               movieArray: viewModel.trendingMovies)
                    
                    columnView(columnTitle: "Upcoming",
                               intwidthh: 170,
                               viewModel: viewModel,
                               movieArray: viewModel.upcomingMovies)
                    
                    columnView(columnTitle: "Top Movies",
                               intwidthh: 300,
                               viewModel: viewModel,
                               movieArray: viewModel.topMovies)
                    
                }
                .padding(.top, 2)
            }
            .task {
                do{
                    await viewModel.fetchMoviesAndDetails()
                } 
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .foregroundColor(.white)
        }
        .sheet(isPresented: $viewModel.isMovieViewActive) {
            MovieView(viewModel: viewModel)
        }
        .onAppear{
            Task {
                await viewModel.fetchMoviesAndDetails()
            }
        }
    }
}


#Preview {
    HomeView(viewModel: HomeViewModel())
}


