//
//  SeeMoreView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 30/12/23.
//

import SwiftUI

struct SeeMoreView: View {
    let columnTitle: String
    let movieArray: [MovieDetail]
    @ObservedObject var accountViewModel: AccountViewModel
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text(columnTitle)
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.top)
                ScrollView(.vertical) {
                    LazyVStack(alignment: .leading) {
                        ForEach(movieArray) { movie in
                            SeeMoreList(movie: movie)
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
                }
            }
//            .fullScreenCover(isPresented: $viewModel.isMovieViewActive) {
//                MovieView(viewModel: viewModel, accountViewModel: accountViewModel)
//            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color("BGColor"))
    }
    
    func deleteItems(at offesets: IndexSet){
        accountViewModel.user.watchList.remove(atOffsets: offesets)
        accountViewModel.saveChanges()
    }
}

#Preview {
    SeeMoreView(columnTitle : "Top Movies", movieArray: mockMovieArray ,accountViewModel: AccountViewModel(), viewModel: HomeViewModel())
}
