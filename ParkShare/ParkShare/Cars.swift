//
//  Cars.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct Cars: View {
    
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
                    NavigationLink(destination: AddCar()){
                        Image(systemName: "plus")
                        Text("Add new Car")
                    }
                }.padding(30)
                
                ScrollView(showsIndicators: false) {
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                    DatiAuto()
                }
                               
                
                Spacer()
                
            }
        }
    }
    
}


struct DatiAuto: View {
    
    var body: some View {
        Rectangle() //Creare una struct per poter utilizzare il rettangolo N volte, tramite un forEach in lettura da Firebase
        .foregroundColor(.clear)
        .frame(width: 375, height: 132)
        .background(Color(red: 0.4, green: 0.42, blue: 0.93))
        .cornerRadius(30)
        .shadow(color: Color(red: 0.4, green: 0.42, blue: 0.93).opacity(0.2), radius: 15, x: 0, y: 2)
        .overlay(
            VStack(spacing: 20){
                
                Text("Dati auto dal db")
                
            }.foregroundColor(.white)
        )
    }
}


struct AddCar: View {
    @State private var modello: String = ""
    @State private var targa: String = ""

    var body: some View {
        Form{
            VStack{
                HStack{
                    
                    TextField("", text: $modello, prompt: Text("Modello*").foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                }
                HStack{
                    
                    TextField("", text: $targa, prompt: Text("Targa*").foregroundColor(Color(red: 0.4, green: 0.42, blue: 0.93)))
                            .padding()
                }
                Button(action: SalvaCar){
                    Text("Salva")
                }.disabled(modello.isEmpty || targa.isEmpty)
                    
                }
        }
    }
    
    func SalvaCar() {
        //salvataggio dati su Firebase
    }
}


struct Cars_Previews: PreviewProvider {
    static var previews: some View {
        Cars()
    }
}
