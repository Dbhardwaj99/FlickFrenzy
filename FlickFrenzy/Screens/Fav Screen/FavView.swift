//
//  FavView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct FavView: View {
    @ObservedObject var accountViewModel: AccountViewModel
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack{
            VStack(alignment: .leading){
                Text("🕥 Watch List")
                    .font(.largeTitle)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .padding(.horizontal)
                    .padding(.top)
                List{
//                                            ForEach(mockUserFavArray) { movie in
                    ForEach(accountViewModel.user.watchList) { movie in
                        MovieList(movie: movie)
                            .id(movie.id)
                            .onTapGesture {
                                viewModel.selectedMovieId = movie.movieDetail.id
                                viewModel.isMovieViewActive = true
                                Task {
                                    await viewModel.fetchMoviesAndDetails()
                                }
                            }
                    }
                    .onDelete(perform: deleteItems)
                    .listRowBackground(Color("BGColor"))
                }
                .listStyle(PlainListStyle())
                .scrollContentBackground(.hidden)
//                .listStyle(InsetGroupedListStyle())
            }
            .fullScreenCover(isPresented: $viewModel.isMovieViewActive) {
                MovieView(viewModel: viewModel, accountViewModel: accountViewModel)
            }
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
    FavView(accountViewModel: AccountViewModel(), viewModel: HomeViewModel())
}


