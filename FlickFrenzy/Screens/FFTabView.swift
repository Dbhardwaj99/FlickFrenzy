//
//  FFTabView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct FFTabView: View {
//    @Published var isTabViewShowing = true
    @StateObject private var viewModel = HomeViewModel()
    @StateObject private var accountViewModel = AccountViewModel()
    
    var body: some View {
        TabView{
            Group{
                HomeView(accountViewModel: accountViewModel, viewModel: viewModel)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Home")
                    }
                FavView()
                    .tabItem {
                        Image(systemName: "popcorn.fill")
                        Text("Watchlist")
                    }
                
                AccountView()
                    .tabItem {
                        Image(systemName: "person")
                        Text("Account")
                    }
            }
            .toolbarBackground(Color("BGColor"), for: .tabBar)
            .toolbarBackground(.visible, for: .tabBar)
        }
        .accentColor(Color.white)
        .navigationBarHidden(true)
    }
}

#Preview {
    FFTabView()
}
