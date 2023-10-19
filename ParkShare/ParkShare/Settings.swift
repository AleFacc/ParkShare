//
//  Settings.swift
//  ParkShare
//
//  Created by user243552 on 10/5/23.
//

import SwiftUI

struct Settings: View {
    @EnvironmentObject private var authModel: AuthViewModel
    @EnvironmentObject var firestoreManager:  FireStoreManager
    @State private var isNotificationEnabled = true
    @State private var isLocationEnabled = true

    var body: some View {
        VStack {
            Text("Settings")
                .font(.system(size: 40).bold())
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 0.92))

            NavigationStack {
                HStack {
                    Text(authModel.user?.email ?? "<User email>")
                }
                .font(.system(size: 25))
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 1))
                .padding(20)

                VStack(alignment: .leading, spacing: 40) {
                    SectionWithBackground {
                        NavigationLink(destination: EditProfile()) {
                            Text("Change Email")
                            Spacer()
                            Image(systemName: "arrowshape.turn.up.right.circle")
                        }
                    }

                    SectionWithBackground {
                        NavigationLink(destination: ChangePassword()) {
                            Text("Change Password")
                            Spacer()
                            Image(systemName: "arrowshape.turn.up.right.circle")
                        }
                    }

                    SectionWithBackground {
                        HStack {
                            Text("Location")
                            Spacer()
                            Toggle("", isOn: $isLocationEnabled)
                                .labelsHidden()
                        }
                    }

                    SectionWithBackground {
                        HStack {
                            Text("Notification")
                            Spacer()
                            Toggle("", isOn: $isNotificationEnabled)
                                .labelsHidden()
                        }
                    }

                    SectionWithBackground {
                        Button(action: {
                            authModel.signOut()
                        }) {
                            Text("Sign Out").foregroundColor(.red).bold()
                        }
                    }

                    Spacer()
                }
                .font(.system(size: 30))
                .foregroundColor(Color(red: 0.38, green: 0.24, blue: 0.92))
                .padding(20)
            }
        }
    }
}

struct SectionWithBackground<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.gray.opacity(0.2))
            content
                .padding()
        }
    }
}



struct Settings_Previews: PreviewProvider {
    static var previews: some View {
        Settings().environmentObject(FireStoreManager())
        .environmentObject(AuthViewModel())    }
}
