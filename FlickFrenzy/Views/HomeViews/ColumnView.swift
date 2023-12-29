//
//  ColumnView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import SwiftUI

struct columnView: View {
    let columnTitle: String
    let intwidthh: CGFloat
    @ObservedObject var viewModel: HomeViewModel
    let movieArray: [MovieDetail]
    @ObservedObject var accountViewModel: AccountViewModel
    
    var body: some View {
        VStack {
            topicHeader(viewModel: viewModel, movieArray: movieArray, title: columnTitle)
            
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(movieArray) { movie in
                        MoviePreView(intwidthh: intwidthh, movie: movie, accountViewModel: accountViewModel)
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

#Preview {
    columnView(columnTitle: "Best Movie", intwidthh: 170, viewModel: HomeViewModel(), movieArray: mockMovieArray, accountViewModel: AccountViewModel())
}
