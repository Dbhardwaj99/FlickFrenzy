//
//  ContentView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 27/12/23.
//

import SwiftUI

struct ContentView: View {
    @State private var showTabView = false
    var body: some View {
        ZStack {
            if showTabView {
                FFTabView()
//                    .gesture(DragGesture()
//                        .onEnded { value in
//                            if value.translation.width < -50 {
//                                withAnimation {
//                                    showTabView = false
//                                }
//                            }
//                        })
            } else {
                VStack{
                    CollageView()
                        .frame(maxWidth: .infinity)
                        .frame(height: 450, alignment: .top)
                        .ignoresSafeArea()
                    
                    Text("Discover & make time for your movies!")
                        .fontWeight(.heavy)
                        .font(.system(size: 40))
                        .lineLimit(2)
                        .minimumScaleFactor(0.01)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    Text("Get to know more about your favourite movie in detail and add it to your watchlist!")
                        .fontWeight(.semibold)
                        .font(.title3)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)
                        .lineLimit(2)
                        .minimumScaleFactor(0.5)
                    
                    Spacer()
                    Button(action: {
                        withAnimation {
                            showTabView = true
                        }
                    }) {
                        Text("Continue")
                            .fontWeight(.bold)
                            .frame(width: 300, height: 50)
                            .background(Color("ColorSecondary"))
                            .cornerRadius(20)
                            .foregroundStyle(Color.black)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(.white)
        .background(Color("BGColor"))
    }
}

#Preview {
    ContentView()
}
