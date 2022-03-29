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
                    .foregroundColor(.secondary)
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
                    Label("In Progress", systemImage: "bolt.circle.fill")
                }
                .tint(.yellow)
            }
        }
        .swipeActions(edge: .trailing, allowsFullSwipe: true) {
            if ticket.status == .inProgress {
                Button(action: { $ticket.status.wrappedValue = .complete }) {
                    Label("Complete", systemImage: "checkmark.circle.fill")
                }
                .tint(.green)
            }
            if ticket.status == .notStarted {
                Button(action: { $ticket.status.wrappedValue = .inProgress }) {
                    Label("In Progress", systemImage: "bolt.circle.fill")
                }
                .tint(.yellow)
            }
        }
    }
}

struct TicketView_Previews: PreviewProvider {
    static var previews: some View {
        let ticket1 = Ticket(reportedBy: "Andrew", product: "Realm", title: "My big issue", problemDescription: "This is a big deal")
        let ticket2 = Ticket(reportedBy: "Andrew", product: "Realm", title: "My second issue")
        ticket2.status = .inProgress
        let ticket3 = Ticket(reportedBy: "Andrew", product: "Realm", title: "Issue three", problemDescription: "This is not such a big deal. But I do want to talk about it at greate length. This is not such a big deal. But I do want to talk about it at greate length.")
        ticket3.status = .complete
        return NavigationView {
            List {
                TicketView(ticket: ticket1)
                TicketView(ticket: ticket2)
                TicketView(ticket: ticket3)
            }
        }
    }
}
