//
//  ChangePassword.swift
//  ParkShare
//
//  Created by user243552 on 10/9/23.
//

import SwiftUI

struct ChangePassword: View {
    var body: some View {
        VStack{
            Image("spunta_verde")
                .resizable()
                .frame(width: 80, height: 80)
            Text("Email inviata con successo")
                .bold()
        }
    }
}

struct ChangePassword_Previews: PreviewProvider {
    static var previews: some View {
        ChangePassword()
    }
}
