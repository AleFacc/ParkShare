//
//  Parcheggio.swift
//  ParkShare
//
//  Created by user243552 on 10/19/23.
//

import Foundation

struct Parcheggio: Identifiable {
    var id: String = UUID().uuidString
    var costoOra: Int
    var emailProprietario    : String
    var indirizzo: String
    var quartiere: String
}
