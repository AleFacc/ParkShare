//
//  ParkShareApp.swift
//  ParkShare
//
//  Created by user243552 on 9/29/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct ParkShareApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
        
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView().environmentObject(AuthViewModel())
                    
            }
        }
    }
}
