//
//  AccountView.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 28/12/23.
//

import SwiftUI

struct AccountView: View {
    @StateObject var ViewModel = AccountViewModel()
    @State private var isImagePickerPresented: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        ZStack{
            Color("BGColor")
                .ignoresSafeArea()
            VStack{
                Spacer()
                Form{
                    Section(header:
                                Text("Personal Info")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    ){
                        HStack {
                            Spacer()
                            ZStack{
                                if let image = selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                } else {
                                    Image("Blank")
                                        .resizable()
                                        .cornerRadius(60)
                                        .frame(width: 100, height: 100)
                                }
                                
                                Button(action: {
                                    isImagePickerPresented = true
                                }) {
                                    Text("                       ")
                                }
                                .frame(width: 100, height: 100)
                                //                    .background(Color("ColorSecondary"))
                                .cornerRadius(60)
                                .sheet(isPresented: $isImagePickerPresented) {
                                    ImagePicker(image: $selectedImage)
                                }
                            }
                            Spacer()
                        }
                        TextField("First Name", text: $ViewModel.user.firstName)
                        TextField("Last Name", text: $ViewModel.user.lastName)
                        TextField("Email", text: $ViewModel.user.email)
                            .autocapitalization(.none)
                            .keyboardType(.emailAddress)
                            .autocorrectionDisabled()
                        TextField("Address", text: $ViewModel.user.address)
                        DatePicker("Birthday",
                                   selection: $ViewModel.user.birthday,
                                   displayedComponents: .date)
                    }
                }
                .scrollContentBackground(.hidden)
                Button(){
                    if let image = selectedImage{
                        ViewModel.setProfileImage(image)
                        ViewModel.saveChanges()
                    } else {
                        // Handle the case where selectedImage is nil or conversion to Data fails
                        print("Error: Could not convert UIImage to Data or selectedImage is nil.")
                    }
                }label: {
                    Text("Save Changes")
                }
                .fontWeight(.bold)
                .frame(width: 300, height: 50)
                .background(Color("ColorSecondary"))
                .cornerRadius(20)
                .foregroundStyle(Color.black)
                
                Spacer()
                
            }
        }
        .onAppear{
            ViewModel.retriveUser()
        }
        .alert(item: $ViewModel.alertItem){ alertItem in
            Alert(title: alertItem.title,
                  message: alertItem.message)
        }
        .foregroundColor(.black)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .toolbarBackground(.red, for: .navigationBar)
    }
}

#Preview {
    AccountView()
}

struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        var parent: ImagePicker
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            
            picker.dismiss(animated: true)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true)
        }
    }
}

