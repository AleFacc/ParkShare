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
                Text("My Parks")
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
    @State private var costo: Double = 0.0

    var body: some View {
        Form{
            VStack{
                    
                List{
                    Section(header: Text("Dati Parcheggio")){
                        TextField("", text: $quartiere, prompt: Text("Quartiere")
                            .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                                                        
                        TextField("", text: $indirizzo, prompt: Text("Indirizzo")
                            .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                    }
                    
                    Section(header: Text("Costo")){
                        HStack{
                            
                            Text("\(costo, specifier: "%.2f") (€/h)")
                                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93))
                                .padding()
                            
                            Stepper("", value: $costo, in: 0.0...100.0, step: 0.5)
                                .foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93))
                                .padding()
                            
                            
                            
                        }
                    }
                }
                    
                
                    
                                    
                
                Button(action: SalvaPark){
                    Text("Salva")
                }.disabled(quartiere.isEmpty || indirizzo.isEmpty || costo <= 0 )
                
                               
                }
        }
    }
    
    func SalvaPark() {
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
