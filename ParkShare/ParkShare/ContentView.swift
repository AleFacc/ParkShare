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
    @StateObject var firestoreManager = FireStoreManager()
        
        var body: some View {
            Group {
                if authModel.user != nil {
                    MainView().environmentObject(authModel)
                } else {
                    SignInView()
                }
            }.onAppear {
                authModel.listenToAuthState()
            }
        }
    
}
