//
//  MoviePreView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct MoviePreView: View {
    let intwidthh: CGFloat
    let movie: MovieDetail
    var body: some View {
        VStack{
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: intwidthh, height: intwidthh <= 200 ? 300 : 400)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .frame(width: intwidthh, height: 125)
            .clipped()
            
            Spacer()
            HStack{
                Text(movie.title)
                    .font(.system(size: 25))
                    .font(.title)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                Spacer()
                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
            }
            .padding(.horizontal)
            Spacer()
            HStack{
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundColor(.yellow)
                Text("\(movie.voteAverage, specifier: "%.2f")")
                    .foregroundColor(.yellow)
                
                Spacer()
                
                Image(systemName: "eye.fill")
//                Text("\(movie.voteCount) Views")
                Text(convertToKs(number:movie.voteCount))
                
            }
            .padding(.horizontal)
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: intwidthh, height: 200)
        .background(Color("ColorPrimary"))
        .cornerRadius(20)
    }
}

func convertToKs(number: Int) -> String{
    let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 1
        
        var result: String
        
        if number >= 1000 && number < 1000000 {
            let dividedValue = Double(number) / 1000.0
            result = formatter.string(from: NSNumber(value: dividedValue)) ?? "\(dividedValue)"
            result += "k"
        } else {
            result = formatter.string(from: NSNumber(value: number)) ?? "\(number)"
        }
    
        result += " Views"
    
        return result
}


#Preview {
    MoviePreView(intwidthh: 200, movie: mockMovieDetail)
}
