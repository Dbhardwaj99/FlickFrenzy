//
//  HomeView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var accountViewModel: AccountViewModel
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
                    Header(accountViewModel: accountViewModel)
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
                    

                    columnView(columnTitle: "🚨Now in Cinema",
                               intwidthh: 170,
                               viewModel: viewModel,
                               movieArray: viewModel.nowMovies,
                               accountViewModel: accountViewModel
                    )
                    
                    columnView(columnTitle: "📈Trending",
                               intwidthh: 300,
                               viewModel: viewModel,
                               movieArray: viewModel.trendingMovies,
                               accountViewModel: accountViewModel
                    )
                    
                    columnView(columnTitle: "🔮Upcoming",
                               intwidthh: 170,
                               viewModel: viewModel,
                               movieArray: viewModel.upcomingMovies,
                               accountViewModel: accountViewModel
                    )
                    
                    columnView(columnTitle: "⭐️Top Movies",
                               intwidthh: 300,
                               viewModel: viewModel,
                               movieArray: viewModel.topMovies,
                               accountViewModel: accountViewModel
                    )
                    
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
        .fullScreenCover(isPresented: $viewModel.isMovieViewActive) {
            MovieView(viewModel: viewModel, accountViewModel: accountViewModel)
        }
        .sheet(isPresented: $viewModel.isSeeMore) {
            SeeMoreView(columnTitle: viewModel.columnTitle,
                        movieArray: viewModel.movieArray,
                        accountViewModel: accountViewModel,
                        viewModel: viewModel
            )
        }
        .onAppear{
            Task {
                await viewModel.fetchMoviesAndDetails()
            }
            accountViewModel.retriveUser()
        }
    }
}


#Preview {
    HomeView(accountViewModel: AccountViewModel(), viewModel: HomeViewModel())
}


