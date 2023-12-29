//
//  HeaderView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import SwiftUI

struct Header: View {
    @ObservedObject var accountViewModel: AccountViewModel
    var body: some View {
        HStack{
            if let imageData = accountViewModel.user.profileImage, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 80, height: 80, alignment: .leading)
            } else {
                Image("Blank")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(60)
                    .frame(width: 80, height: 80, alignment: .leading)
            }

            VStack(alignment: .leading){
                Text("Welcome back,")
                Text(accountViewModel.user.firstName.isEmpty ? "User" : accountViewModel.user.firstName)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            Spacer()
        }
        .padding(.all)
    }
}

#Preview {
    Header(accountViewModel: AccountViewModel())
}
