//
//  RTicketApp.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI
import RealmSwift

let realmApp = RealmSwift.App(id: "rticket-xxxxx")

@main
struct RTicketApp: SwiftUI.App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
