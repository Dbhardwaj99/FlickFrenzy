//
//  MovieView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct MovieView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var movie: MovieDetailResponse {
            if let movie = viewModel.movie {
                return movie
            } else {
                return mockMovieDetailResponses
            }
        }
        
    var movieCast: [CastDetail]{
        return viewModel.movieCast
    }
    
//    @Binding var isMovieViewActive: Bool
//    var movie: MovieDetailResponse
//    var movieCast: [CastDetail] = []
    
    
    @State var wantSeeMore:Bool = false
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack(){
                ScrollView{
                    GeometryReader { geometry in
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(height: 650)
                                .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        } placeholder: {
                            Image("Blank")
                                .resizable()
                                .scaledToFill()
                                .frame(height: 650)
                                .frame(maxWidth: 400)
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
                    .frame(height: 30)
                    .padding()
                    
                    HStack{
                        ScrollView(.horizontal) {
                            LazyHStack(alignment: .top) {
                                ForEach(movie.genres) { genre in
                                    Text(genre.name)
                                        .font(.caption2)
                                        .fontWeight(.semibold)
                                        .frame(width: 80, height: 30)
                                        .background(Color("ColorPrimary"))
                                        .cornerRadius(25)
                                }
                            }
                            .padding(.trailing)
                        }
                        .frame(width: 250, height: 30, alignment: .top)
                        
                        Spacer()
                        
                        Image(systemName: "clock.fill")
                        Text(convertMinutesToHoursAndMinutes(minutes: movie.runtime ?? 0 ))
                    }
                    .padding(.leading)
                    .padding(.trailing)
                    
                    if movie.overview == ""{
                        
                    }else{
                        topicHeader(title: "About film")
                            .frame(height: 30)
                            .onTapGesture {
                                wantSeeMore = true
                            }
                        
                        Text(movie.overview ?? "")
                            .font(.system(size: wantSeeMore ? 18 : 25))
                            .fontWeight(.regular)
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .lineLimit(wantSeeMore ? 10 : 2)
                            .minimumScaleFactor(0.8)
                            .padding(.all)
                    }
                    
                    topicHeader(title: "Cast & Crew")
                        .frame(height: 30)
                        .padding(.bottom)
                    castColumnView(casts: movieCast)
                    
                    
                    Text("More Info")
                        .font(.title2)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .padding(.horizontal)
                        .padding(.top)
                    
                    VStack(alignment: .leading, spacing: 5){
                        HStack{
                            Image(systemName: "calendar")
                                .resizable()
                                .frame(width: 35, height: 35)
                            Text("Release Date: ")
                            Spacer()
                            Text(movie.releaseDate ?? "Not Available")
                        }
                        .frame(height:50)
                        .padding(.horizontal)
                        
                        HStack{
                            Image("Paycheque")
                            Text("Budget: ")
                            Spacer()
                            Text("\(movie.budget)")
                        }
                        .frame(height:50)
                        .padding(.horizontal)
                        
                        HStack{
                            Image("Profit")
                            Text("Revenue: ")
                            Spacer()
                            Text("\(movie.revenue)")
                        }
                        .frame(height:50)
                        .padding(.horizontal)
                    }
                    
                    Spacer()
                    Button(action: {

                    }) {
                        Text("Add to watchlist")
                            .fontWeight(.bold)
                            .frame(width: 300, height: 50)
                            .background(Color("ColorSecondary"))
                            .cornerRadius(20)
                            .foregroundStyle(Color.black)
                    }
                    Spacer()
                }
            }
            .ignoresSafeArea()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
    }
}

#Preview {
    MovieView(viewModel: HomeViewModel())
}


func convertMinutesToHoursAndMinutes(minutes: Int) -> String {
    let hours = minutes / 60
    let remainingMinutes = minutes % 60
    
    if hours == 0 {
        return "\(remainingMinutes)m"
    } else if remainingMinutes == 0 {
        return "\(hours)h"
    } else {
        return "\(hours)h \(remainingMinutes)m"
    }
}


