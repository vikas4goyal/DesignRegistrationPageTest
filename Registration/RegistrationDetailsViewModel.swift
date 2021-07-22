//
//  RegistrationDetailsViewModel.swift
//  Registration
//
//  Created by vikas on 22/07/21.
//

import SwiftUI
import Combine

class RegistrationDetailsViewModel: ObservableObject {
    @Published var name:String = ""
    @Published var email:String = ""
    @Published var homePhone:String = ""
    @Published var mobilePhone:String = ""
    @Published var address:String = ""
    @Published var zipCode:String = ""
    @Published var alertMessage:String = ""
    @Published var showAlert:Bool = false
    @Published var isLinkActive:Bool = false
    
    func submitClicked() {
        if let validationError = validateData() {
            self.alertMessage = validationError
            self.showAlert = true
        }
        self.isLinkActive = true
    }
    
    func validateData() -> String? {
        if name.count == 0 || name.count > 25  {
            return name.count == 0 ? "Name can not be empty" : "Name should be less then or equal to 25 char long"
        }
        
        if email.count > 25  {
            return "Email should be less then or equal to 25 char long"
        }
        
        if !isValidEmail(email) {
            return "Please enter valid email"
        }
        
        if (homePhone.count > 10 || homePhone.count == 0) && (mobilePhone.count > 10 || mobilePhone.count == 0) {
            return "Please enter valid home phone number or mobile phone number "
        }
        
        if address.count == 0 || address.count > 100 {
            return address.count == 0 ? "Address can not be empty" : "Address should be less then or equal to 100 char long"
        }
        
        if zipCode.count == 0 || zipCode.count > 6 {
            return zipCode.count == 0 ? "Zip code can not be empty" : "Zip code should be less then or equal to 6 char long"
        }
        
        return nil
    }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
