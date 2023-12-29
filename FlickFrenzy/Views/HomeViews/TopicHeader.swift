//
//  TopicHeader.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import SwiftUI

struct topicHeader: View {
    @ObservedObject var viewModel: HomeViewModel
    let movieArray: [MovieDetail]
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
                .onTapGesture {
                    viewModel.columnTitle = title
                    viewModel.movieArray = movieArray
                    viewModel.isSeeMore = true
                }
        }
        .padding(.horizontal)
        .padding(.top)
    }
}

#Preview {
    topicHeader(viewModel: HomeViewModel(), movieArray: mockMovieArray, title: "Best Movie")
}
