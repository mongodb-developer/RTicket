//
//  LoginView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI

struct LoginView: View {
    @Binding var username: String?
    
    var body: some View {
        Text("Logging in......")
            .foregroundColor(.yellow)
            .task {
                await login()
            }
    }
    
    private func login() async {
        do {
            let user = try await realmApp.login(credentials: .anonymous)
            username = user.id
        } catch {
            print("Failed to login: \(error.localizedDescription)")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(username: .constant(nil))
    }
}
