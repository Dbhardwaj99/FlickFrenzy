//
//  CollageView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}


struct CollageView: View {
    @State var movies: [MovieDetail] = []
    
    var body: some View {
        HStack{
            ForEach(movies.chunked(into: 3), id: \.first?.movieid) { chunk in
                CollagePicView(movies: chunk)
            }
        }
        .frame(width: 400, height: 500)
        .clipShape(Rectangle())
        
        .task {
            do{
                movies = try await getMovies(value: 1)
            }  catch {
                print("Error fetching movies: \(error)")
            }
        }
    }
}

#Preview {
    CollageView()
}
