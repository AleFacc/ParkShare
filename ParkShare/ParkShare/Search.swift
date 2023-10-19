//
//  Search.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct Search: View {
    
    var search: String
    @ObservedObject var viewModel = FireStoreManager()
    
    var body: some View {
        Text("\(self.search)")
        
        List(viewModel.parcheggi) { parcheggi in
                VStack(alignment: .leading) {
                    Text(parcheggi.id)
                    .font(.headline)
                    Text(String(parcheggi.costoOra))
                        .font(.subheadline)
                    Text(parcheggi.emailProprietario)
                    .font(.subheadline)
                    Text(parcheggi.indirizzo)
                    .font(.subheadline)
                    Text(parcheggi.quartiere)
                    .font(.subheadline)
                }
              }
              .navigationBarTitle("Parcheggi")
              .onAppear() { // (3)
                  self.viewModel.fetchDataSearch(luogo: self.search )
              }
    }
}
