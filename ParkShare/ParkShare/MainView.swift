//
//  MainView.swift
//  ParkShare
//
//  Created by user243552 on 9/29/23.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject private var authModel: AuthViewModel
    @State private var search: String = ""
    @EnvironmentObject var firestoreManager: FireStoreManager
    
    
    
    var body: some View {
        NavigationStack{
            
            
            TabView{
                VStack (alignment: .center,spacing: 100) {
                    Rectangle(
                        
                    )
                    .foregroundColor(.clear)
                    .frame(width: 375, height: 132)
                    .background(Color(red: 0.4, green: 0.42, blue: 0.93))
                    .cornerRadius(30)
                    .shadow(color: Color(red: 0.4, green: 0.42, blue: 0.93).opacity(0.2), radius: 15, x: 0, y: 2)
                    .overlay(
                        VStack(spacing: 20){
                            
                            Text("Hi, \(authModel.user?.email ?? "")")
                                .bold()
                            
                            HStack (spacing: 50){
                                
                                VStack (spacing: 10){
                                    
                                    NavigationLink(destination: Settings()){
                                        Text("Settings")
                                        Image(systemName: "wrench.fill")
                                    }
                                    
                                    
                                }
                                
                                
                            }
                        }
                            .foregroundColor(.white)
                    )
                    
                    VStack (spacing: 20){
                        Text("Search for a parking")
                        
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 343, height: 56)
                            .background(Color(red: 0.99, green: 0.99, blue: 1))
                            .cornerRadius(6)
                            .shadow(color: Color(red: 0.48, green: 0.48, blue: 0.48).opacity(0.32), radius: 10, x: 0, y: 8)
                            .overlay(
                                HStack (spacing: 20){
                                    Image(systemName: "mappin.and.ellipse")
                                    TextField("Search....", text: $search)
                                    NavigationLink(destination: Search(search: self.search)){
                                        Image(systemName:"arrowshape.turn.up.right.circle")
                                    }
                                    
                                }.padding(10)
                            )
                    }
                    
                    
                    VStack(spacing: 20){
                        Text("Your Reservation")
                        
                        List{
                            /*ForEach(firestoreManager.prenotazioniID, id: \.self) { result in
                             Text("Id Parcheggio: \(result)")
                             }*/
                        }
                        
                    }
                    
                    Spacer()
                    
                    
                }.toolbar {
                    ToolbarItemGroup(placement: .navigationBarLeading) {
                        Button(
                            action: {
                                authModel.signOut()
                            },
                            label: {
                                Text("Sign Out")
                                    .bold()
                            }
                        )
                    }
                }
                .tabItem{
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                Cars()
                    .tabItem{
                        Image(systemName: "car.fill")
                        Text("Your car")
                    }
                History()
                    .tabItem{
                        Image(systemName: "timer")
                        Text("History")
                    }
                MyParks()
                    .tabItem{
                        Image(systemName: "plus.circle.fill")
                        Text("My Parks")
                    }
            }
            
        }
    }
    
}
    
    struct MainView_Previews: PreviewProvider {
        static var previews: some View {
            MainView().environmentObject(FireStoreManager())
                .environmentObject(AuthViewModel())
        }
    }

