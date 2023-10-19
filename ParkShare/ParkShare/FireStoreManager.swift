//
//  FireStoreManager.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI
import Firebase

class FireStoreManager: ObservableObject{
    
    @Published var prenotazioni = [Prenotazione]()
    @Published var parcheggi = [Parcheggio]()
    @ObservedObject var auth = AuthViewModel()
    
    private var db = Firestore.firestore()
      
    func fetchData(email: String?) {
          print("Ciao",self.auth)
          db.collection("prenotazioni").whereField("emailAcquirente", isEqualTo: email).addSnapshotListener { (querySnapshot, error) in
          guard let documents = querySnapshot?.documents else {
            print("No documents")
            return
          }
            
            

          self.prenotazioni = documents.map { queryDocumentSnapshot -> Prenotazione in
            let data = queryDocumentSnapshot.data()
                  let emailAcquirente = data["emailAcquirente"] as? String ?? ""
                  let idParcheggio = data["idParcheggio"] as? String ?? ""
                  let oraArrivo = data["oraArrivo"] as? String ?? ""
                    let oraFine = data["oraFine"] as? String ?? ""

                    return Prenotazione(id: queryDocumentSnapshot.documentID, emailAcquirente: emailAcquirente, idParcheggio: idParcheggio, oraArrivo: oraArrivo, oraFine: oraFine)
          }
        }
      }
    
    func fetchDataSearch(luogo: String) {
        print("Ciao",self.auth)
        db.collection("parcheggi").whereField("quartiere", isEqualTo: luogo).addSnapshotListener { (querySnapshot, error) in
        guard let documents = querySnapshot?.documents else {
          print("No documents")
          return
        }
          
          

        self.parcheggi = documents.map { queryDocumentSnapshot -> Parcheggio in
          let data = queryDocumentSnapshot.data()
                let costoOra = data["costoOra"] as? Int ?? 0
                let emailProprietario = data["emailProprietario"] as? String ?? ""
                let indirizzo = data["indirizzo"] as? String ?? ""
                  let quartiere = data["quartiere"] as? String ?? ""

                  return Parcheggio(id: queryDocumentSnapshot.documentID, costoOra: costoOra, emailProprietario: emailProprietario, indirizzo: indirizzo, quartiere: quartiere)
        }
      }
    }
    
    //@Published var prenotazioniID: [String] = []
    //@EnvironmentObject private var authModel: AuthViewModel
    
    			
    
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
