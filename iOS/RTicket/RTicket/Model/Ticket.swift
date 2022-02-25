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
    
    convenience init(reportedBy: String, product: String, title: String, problemDescription: String?) {
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
