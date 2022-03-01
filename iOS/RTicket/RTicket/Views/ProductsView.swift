//
//  ProductsView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI

struct ProductsView: View {
    let username: String
    var isPreview = false
    
    let products = ["Atlas", "Realm", "Search", "Charts"]
    
    var body: some View {
        List {
            ForEach(products, id: \.self) { product in
                if !isPreview {
                    if let currentUser = realmApp.currentUser {
                        NavigationLink(destination: TicketsView(product: product, username: username)
                                        .environment(\.realmConfiguration, currentUser.flexibleSyncConfiguration())) {
                            Text(product)
                        }
                    }
                } else {
                    NavigationLink(destination: TicketsView(product: product, username: username, isPreview: true)) {
                        Text(product)
                    }
                }
            }
        }
        .navigationBarTitle("Products", displayMode: .inline)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductsView(username: "Andrew", isPreview: true)
        }
    }
}
