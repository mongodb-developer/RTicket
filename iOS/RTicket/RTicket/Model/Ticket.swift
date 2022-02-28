//
//  Ticket.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import Foundation
import RealmSwift

class Ticket: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id: ObjectId
    @Persisted var reportedBy = ""
    @Persisted var product = ""
    @Persisted var title = ""
    @Persisted var problemDescription: String?
    @Persisted var created = Date()
    @Persisted var status = TicketStatus.notStarted
    
    convenience init(reportedBy: String, product: String, title: String, problemDescription: String? = nil) {
        self.init()
        self.reportedBy = reportedBy
        self.product = product
        self.title = title
        self.problemDescription = problemDescription
    }
}

enum TicketStatus: String, PersistableEnum {
    case notStarted
    case inProgress
    case complete
}

extension Ticket {
    static var areTicketsPopulated: Bool {
        do {
            let realm = try Realm()
            let ticketObjects = realm.objects(Ticket.self)
            return ticketObjects.count >= 3
        } catch {
            print("Error, couldn't read Tickey objects from Realm: \(error.localizedDescription)")
            return false
        }
    }
    
    static func bootstrapTickets() {
        do {
            let realm = try Realm()
            let ticket1 = Ticket(reportedBy: "Andrew", product: "Realm", title: "Problem 1", problemDescription: "This is the first problem")
            let ticket2 = Ticket(reportedBy: "Rod", product: "Realm", title: "Problem 2")
            let ticket3 = Ticket(reportedBy: "Jane", product: "Realm", title: "Problem 3", problemDescription: "This is the third problem. It should have a longer description that I'd expect to see wrap over multiple lines in the UI")
            ticket1.status = .complete
            ticket3.status = .inProgress
            try realm.write {
                realm.delete(realm.objects(Ticket.self))
                realm.add(ticket1)
                realm.add(ticket2)
                realm.add(ticket3)
            }
        } catch {
            print("Error, couldn't read decision objects from Realm: \(error.localizedDescription)")
        }
    }
}
