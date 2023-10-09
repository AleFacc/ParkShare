//
//  History.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct History: View {
    var body: some View {
        VStack {
            Text("History")
                .font(.largeTitle)
                .foregroundColor(.blue)
                .padding(.top, 20)
            
            // Primo rettangolo pazzo
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 375, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 70, height: 40)
                            .offset(x: -145, y: -25)
                        
                        Text("poi")
                            .foregroundColor(.white)
                            .font(.headline)
                            .offset(x: -145, y: -25)

                    }
                )
                .overlay(
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                        .offset(y: 0)
                )
                .overlay(
                    Text("città")
                        .foregroundColor(.black)
                        .font(.headline)
                        .offset(x: 150, y: -35)
                )
                .padding()
            
            // Secondo rettangolo pazzo
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 375, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 70, height: 40)
                            .offset(x: -145, y: -25)
                        
                        Text("collegate")
                            .foregroundColor(.white)
                            .font(.headline)
                            .offset(x: -145, y: -25)
                    }
                )
                .overlay(
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                        .offset(y: 0)
                )
                .overlay(
                    Text("città")
                        .foregroundColor(.black)
                        .font(.headline)
                        .offset(x: 150, y: -35)
                )
                .padding()
            
            // Terzo rettangolo pazzo
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.white)
                .frame(width: 375, height: 100)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(Color.blue)
                            .frame(width: 70, height: 40)
                            .offset(x: -145, y: -25)
                        
                        Text("il db")
                            .foregroundColor(.white)
                            .font(.headline)
                            .offset(x: -145, y: -25)
                    }
                )
                .overlay(
                    Rectangle()
                        .fill(Color.black)
                        .frame(height: 1)
                        .offset(y: 0)
                )
                .overlay(
                    Text("città")
                        .foregroundColor(.black)
                        .font(.headline)
                        .offset(x: 150, y: -35)
                )
                .padding()
            
            Spacer()
        }
    }
}

struct History_Previews: PreviewProvider {
    static var previews: some View {
        History()
    }
}







