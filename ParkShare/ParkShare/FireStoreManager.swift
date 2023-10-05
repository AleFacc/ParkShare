//
//  FireStoreManager.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI
import Firebase

class FireStoreManager: ObservableObject{
    
    @Published var prenotazioniID: [String] = []
    @EnvironmentObject private var authModel: AuthViewModel
    
    /*init() {
        fetchAllRestaurants()
    }*/
    
    /*func fetchAllRestaurants() {
            let db = Firestore.firestore()
        //let email = authModel.user?.email

            db.collection("prenotazioni").getDocuments() { (querySnapshot, error) in
                            if let error = error {
                                    print("Error getting documents: \(error)")
                            } else {
                                    for document in querySnapshot!.documents {
                                        self.prenotazioniID.append("\(document.documentID) - \(email)")
                                            print("\(document.documentID): \(document.data())")
                                    }
                            }
            }
    }*/
    
}
