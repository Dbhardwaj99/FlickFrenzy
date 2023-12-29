import SwiftUI

final class AccountViewModel: ObservableObject{
    @AppStorage("user") private var userData: Data?
    @Published var alertItem: AlertItem?
    @Published var showingAlert: Bool = false
    
    @Published var user = User()
    
    var isValidForm: Bool{
        guard !user.firstName.isEmpty && !user.lastName.isEmpty && !user.email.isEmpty && !user.address.isEmpty else {
            alertItem = AlertContext.isFieldEmpty
            return false
        }
        
        guard user.email.isValidEmail else{
            alertItem = AlertContext.isEmailValid
            return false
        }
        
        return true
    }
    
    func saveChanges(){
        guard isValidForm else { return }
        
        do {
            let data = try JSONEncoder().encode(user)
            userData = data
            alertItem = AlertContext.userSuccess
        } catch {
            alertItem = AlertContext.userError
        }
    }
    
    func retriveUser(){
        guard let userData = userData else { return }
        
        do{
            user = try JSONDecoder().decode(User.self, from: userData)
        }catch{
            alertItem = AlertContext.userError
        }
    }
    
    func setProfileImage(_ image: UIImage) {
        user.profileImage = image.pngData()
    }
    
    var userProfileImage: UIImage? {
        guard let imageData = user.profileImage else { return nil }
        return UIImage(data: imageData)
    }
}

extension String {
    var isValidEmail: Bool {
        // This is a basic regex pattern for email validation.
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: self)
    }
}
