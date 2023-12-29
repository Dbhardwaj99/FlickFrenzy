//
//  Alerts.swift
//  FlickFrenzy
//
//  Created by Divyansh Bhardwaj on 29/12/23.
//

import SwiftUI

struct AlertItem: Identifiable{
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton = Alert.Button.default(Text("OK"))
}

struct AlertContext{
    //Marks: -Network Alerts
    static let invalidURL = AlertItem(title: Text("Invalid API"),
                                      message: Text("API endpoint isn't working, Please check the codebase"))
                            
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                           message: Text("Invalid Response from the Server"))
    
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("Data recived was invalid, Please Check!"))
    
    static let unableToComplete = AlertItem(title: Text("Internel Server Error"),
                                            message: Text("There was some issue with connecting with the server, please check your internet connection"))
    
    static let unableToDecode = AlertItem(title: Text("Unable to Decode"),
                                          message: Text("Decoder object wasn't able to decode the JSON object, please check the format"))
    
    //Marks: -Account Alerts
    static let isFieldEmpty = AlertItem(title: Text("Fields can't be empty"),
                                          message: Text("You need to fill out all the fields in order to submit"))
    
    static let isEmailValid = AlertItem(title: Text("Email is not valid"),
                                          message: Text("Please enter a valid email!"))
    
    static let userSuccess = AlertItem(title: Text("Preferences Saved"),
                                          message: Text("Your Details and preferences have been saved for future uses."))
    
    static let userError = AlertItem(title: Text("Profile Error"),
                                          message: Text("Something is wrong with the data you provided, please check!"))
    
    //Marks: -Order Alerts
    static let orderPlaced = AlertItem(title: Text("Order Placed!"),
                                          message: Text("Chillax, We will deliver your order shortly to your address"))
}

