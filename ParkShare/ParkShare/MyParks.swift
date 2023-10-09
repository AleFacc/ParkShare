//
//  MyParks.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct MyParks: View {
    var body: some View {
        NavigationStack{
            VStack{
                Text("My Cars")
                    .font(
                        .system(size: 40).bold()
                    )
                    .foregroundColor(Color(red: 0.38, green: 0.24, blue: 0.92))
                
                HStack{
                    Spacer()
                    NavigationLink(destination: AddPark()){
                        Image(systemName: "plus")
                        Text("Add new Park")
                    }
                }.padding(30)
                
                ScrollView(showsIndicators: false) {
                    
                    //aggiungere condizione: se nel db non sono presenti parcheggi per l'utente, visualizzare messaggio di avviso
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                    DatiParcheggio()
                }
                               
                
                Spacer()
                
            }
        }
    }
}


struct AddPark: View {
    @State private var quartiere: String = ""
    @State private var indirizzo: String = ""
    @State private var costo: String = ""

    var body: some View {
        Form{
            VStack{
                HStack{
                    
                    TextField("", text: $quartiere, prompt: Text("Quartiere*").foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                }
                HStack{
                    
                    TextField("", text: $indirizzo, prompt: Text("Indirizzo*").foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                }
                HStack{
                    
                    TextField("", text: $costo, prompt: Text("Costo €/h*").foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                }
                Button(action: SalvaCar){
                    Text("Salva")
                }.disabled(quartiere.isEmpty || indirizzo.isEmpty || costo.isEmpty)
                
                
                
                
                }
        }
    }
    
    func SalvaCar() {
        //Scrittura dati su Firebase
    }
}

struct DatiParcheggio: View {
    
    var body: some View {
        Rectangle() //Creare una struct per poter utilizzare il rettangolo N volte, tramite un forEach in lettura da Firebase
        .foregroundColor(.clear)
        .frame(width: 375, height: 132)
        .background(Color(red: 0.4, green: 0.42, blue: 0.93))
        .cornerRadius(30)
        .shadow(color: Color(red: 0.4, green: 0.42, blue: 0.93).opacity(0.2), radius: 15, x: 0, y: 2)
        .overlay(
            VStack(spacing: 20){
                
                Text("Dati parcheggio dal db")
                
            }.foregroundColor(.white)
        )
    }
}


struct MyParks_Previews: PreviewProvider {
    static var previews: some View {
        MyParks()
    }
}
