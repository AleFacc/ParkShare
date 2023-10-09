//
//  Settings.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject private var authModel: AuthViewModel
    let paddingCharacter = " "
    @EnvironmentObject var firestoreManager: FireStoreManager
    
    var body: some View {
        
        VStack{
            Text("Settings")
                .font(
                    .system(size: 40).bold()
                )
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 0.92))
            NavigationStack{
                VStack (alignment: .leading, spacing: 40){
                    HStack{
                        
                        Image(systemName:"arrowshape.turn.up.right.circle")
                        Text("Hi, \(authModel.user?.email ?? "")")
                             
                             }
                    HStack{
                        NavigationLink(destination: EditProfile()){            Text("Edit profile")
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    
                    HStack{
                        NavigationLink(destination: ChangePassword()){               Text("Change Password")
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    HStack{
                        NavigationLink(destination: Privacy()){            Text("Privacy")
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                        
                    }
                    HStack{
                        NavigationLink(destination: Location()){      Text("Location")
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    HStack{
                        Text("Notification")
                        Image(systemName:"arrowshape.turn.up.right.circle")
                        
                    }
                    Button(
                        action: {
                            authModel.signOut()
                        },
                        label: {
                            Text("Sign Out")
                                
                        }
                    )
                    Spacer()
                    
                }.font(
                    .system(size: 30)
                )
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 0.92))
                .padding(20)
                
                
                
                
            }
        }        }
}

    
        
    


struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(FireStoreManager())
        .environmentObject(AuthViewModel())    }
}
