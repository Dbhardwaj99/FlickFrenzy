//
//  HomeScreenViews.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct castColumnView: View {
    let casts: [CastDetail]
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                LazyHStack(alignment: .top) {
                    ForEach(casts) { cast in
                        CastPreView(cast: cast)
                            .id(cast.id)
                    }
                }
                .frame(height: 300)
                .padding(.horizontal)
            }
        }
    }
}

#Preview {
    castColumnView(casts: mockCastDetailArray)
}
