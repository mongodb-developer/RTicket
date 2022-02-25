//
//  ProductsView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI

struct ProductsView: View {
    let username: String
    let products = ["Atlas", "Realm", "Search", "Charts"]
    
    var body: some View {
        List {
            ForEach(products, id: \.self) { product in
                NavigationLink(destination: TicketsView(product: product, username: username)
                                .environment(\.realmConfiguration, realmApp.currentUser!.flexibleSyncConfiguration())) {
                    Text(product)
                }
            }
        }
        .navigationBarTitle("Products", displayMode: .inline)
    }
}

struct ProductsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ProductsView(username: "Andrew")
        }
    }
}
