//
//  TicketView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI
import RealmSwift

struct TicketView: View {
    @ObservedRealmObject var ticket: Ticket
    
    var body: some View {
        VStack {
            HStack {
                Text(ticket.title)
                    .font(.headline)
                    .foregroundColor(ticket.status == .notStarted ? .red : ticket.status == .inProgress ? .yellow : .green)
                Spacer()
                DateView(date: ticket.created)
                    .font(.caption)
            }
            HStack {
                Text(ticket.problemDescription ?? "Not a clue")
                    .font(.caption)
                    .foregroundColor(.gray)
                Spacer()
            }
        }
        .swipeActions(edge: .leading, allowsFullSwipe: true) {
            if ticket.status == .inProgress {
                Button(action: { $ticket.status.wrappedValue = .notStarted }) {
                    Label("Not Started", systemImage: "stop.circle.fill")
                }
                .tint(.red)
            }
            if ticket.status == .complete {
                Button(action: { $ticket.status.wrappedValue = .inProgress }) {
                    Label("In Progress", systemImage: "bolt.fill")
                }
                .tint(.yellow)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            if ticket.status == .inProgress {
                Button(action: { $ticket.status.wrappedValue = .complete }) {
                    Label("Complete", systemImage: "checkmark.rectangle")
                }
                .tint(.green)
            }
            if ticket.status == .notStarted {
                Button(action: { $ticket.status.wrappedValue = .inProgress }) {
                    Label("In Progress", systemImage: "bolt.fill")
                }
                .tint(.yellow)
            }
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        List {
            TicketView(ticket: Ticket(reportedBy: "Andrew", product: "Realm", title: "Something is smoking", problemDescription: "I didn't touch anything! Honestly I didn't!"))
        }
    }
}
