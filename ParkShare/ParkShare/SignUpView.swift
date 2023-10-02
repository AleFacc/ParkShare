//
//  SignUpView.swift
//  ParkShare
//
//  Created by user243552 on 9/29/23.
//

import SwiftUI

struct SignUpView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    @State private var eta: Int = 0
    
    var body: some View {
        Form {
            Group {
                
                TextField("Email", text: $emailAddress)
                    .textContentType(.emailAddress)
                    .textInputAutocapitalization(.never)
                    .disableAutocorrection(true)
                    .keyboardType(.emailAddress)
                SecureField("Password", text: $password)
                    .textContentType(.password)
                    .keyboardType(.default)
                
                HStack{
                    Stepper("Enter your age", value: $eta, in: 0...100)
                    Text("\(eta)")
                }
                
               
            }
            
                Group {
                    
                    if emailAddress != "" && password.count > 6 && eta >= 18{
                        Button(
                            action: {
                                authModel.signUp(
                                    emailAddress: emailAddress,
                                    password: password
                                )
                            },
                            label: {
                                Text("Sign Up")
                                    .bold()
                            }
                        )
                    }
                    
                    if emailAddress != "" || password.count > 6 || eta != 0{
                        Button {
                            self.emailAddress = ""
                            self.password = ""
                            self.eta = 0
                        } label: {
                            Text("Clear")
                                .bold()
                        }
                    }
                }
        }.navigationTitle("Sign Up")
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

