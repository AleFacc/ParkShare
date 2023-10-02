//
//  ContentView.swift
//  ParkShare
//
//  Created by user243552 on 9/29/23.
//

import SwiftUI
import Firebase


struct ContentView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
        
        var body: some View {
            Group {
                if authModel.user != nil {
                    MainView()
                } else {
                    SignInView()
                }
            }.onAppear {
                authModel.listenToAuthState()
            }
        }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
