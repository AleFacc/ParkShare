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
                
                HStack{
                    
                    //Image(systemName:"arrowshape.turn.up.right.circle")
                    Text(authModel.user?.email ?? "<User email>")
                        
                }.font(
                    .system(size: 25)
                )
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 1))
                .padding(20)
                
                VStack (alignment: .leading, spacing: 40){
                    
                    HStack{
                        NavigationLink(destination: EditProfile()){            Text("Edit profile")
                            Spacer()
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    
                    HStack{
                        NavigationLink(destination: ChangePassword()){         Text("Change Password")
                            Spacer()
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    HStack{
                        NavigationLink(destination: Privacy()){            Text("Privacy")
                            Spacer()
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                        
                    }
                    HStack{
                        NavigationLink(destination: Location()){      Text("Location")
                            Spacer()
                            Image(systemName:"arrowshape.turn.up.right.circle")
                        }
                    }
                    HStack{
                        Text("Notification")
                        Spacer()
                        Image(systemName:"arrowshape.turn.up.right.circle")
                        
                    }
                    Button(
                        action: {
                            authModel.signOut()
                        },
                        label: {
                            Text("Sign Out").foregroundColor(.red).bold()
                                
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
