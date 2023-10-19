//
//  Prenotazione.swift
//  ParkShare
//
//  Created by user243552 on 10/19/23.
//

import Foundation

struct Prenotazione: Identifiable {
    var id: String = UUID().uuidString
    var emailAcquirente: String
    var idParcheggio	: String
    var oraArrivo: String
    var oraFine: String
}
