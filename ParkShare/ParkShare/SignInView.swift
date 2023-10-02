//
//  SignInView.swift
//  ParkShare
//
//  Created by user243552 on 9/29/23.
//

import SwiftUI

struct SignInView: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @State private var emailAddress: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
        Text("Login here")
        .font(.largeTitle)
        .frame(maxWidth: .infinity)
        .font(.title)
        .foregroundColor(Color.white)
        .padding()
        .background(Color(red: 97/255, green: 62/255, blue: 234/255))
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
                }
                
                Group {
                    NavigationLink {
                        SignUpView().environmentObject(AuthViewModel())
                    } label: {
                        Text("Don't have an account? Sign up")
                    }
                    
                    if emailAddress != "" && password.count > 6{
                        Button(
                            action: {
                                authModel.signIn(
                                    emailAddress: emailAddress,
                                    password: password
                                )
                            },
                            label: {
                                Text("Sign In")
                                    .bold()
                            }
                        )
                    }
                    
                    if emailAddress != "" || password.count > 6{
                        Button {
                            self.emailAddress = ""
                            self.password = ""
                        } label: {
                            Text("Clear")
                                .bold()
                        }
                    }
                }
            }.navigationTitle("Sign In")
        }
    }
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
}
