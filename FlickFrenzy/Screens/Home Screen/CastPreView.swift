//
//  CastPreView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct CastPreView: View {
    let cast: CastDetail
    var body: some View {
        VStack{
            GeometryReader { geometry in
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(cast.profilePath ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                } placeholder: {
                    Rectangle()
                        .foregroundColor(.gray)
                }
            }
            .frame(width: 200, height: 200)
            .clipped()
            
            Spacer()
            VStack(alignment: .leading){
                Text(cast.name)
                    .font(.system(size: 25))
                    .font(.title)
                    .fontWeight(.bold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
                Text(cast.character)
                    .font(.system(size: 20))
                    .font(.title3)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .minimumScaleFactor(0.8)
            }
            .padding(.trailing, 10)
            Spacer()
        }
        .foregroundColor(.white)
        .frame(width: 200, height: 300)
        .background(Color("ColorPrimary"))
        .cornerRadius(20)
    }
}

#Preview {
    CastPreView(cast: mockCastDetail)
}
