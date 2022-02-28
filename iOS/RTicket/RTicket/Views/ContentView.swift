//
//  ContentView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var username: String?
    
    var body: some View {
        NavigationView {
            Group {
                if let username = username {
                    ProductsView(username: username)
                } else {
                    if useEmailPasswordAuth {
                        EmailLoginView(username: $username)
                    } else {
                        LoginView(username: $username)
                    }
                }
            }
            .navigationBarItems(trailing: username != nil && useEmailPasswordAuth ? LogoutButton(username: $username) : nil)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
