//
//  DateView.swift
//  RTicket
//
//  Created by Andrew Morgan on 25/02/2022.
//

import SwiftUI

struct DateView: View {
    let date: Date
    
    private var isLessThanOneMinute: Bool { date.timeIntervalSinceNow > -60 }
    private var isLessThanOneDay: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 }
    private var isLessThanOneWeek: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 * 7}
    private var isLessThanOneYear: Bool { date.timeIntervalSinceNow > -60 * 60 * 24 * 365}
    
    var body: some View {
        if isLessThanOneMinute {
            Text(date.formatted(.dateTime.hour().minute().second()))
        } else {
            if isLessThanOneDay {
                Text(date.formatted(.dateTime.hour().minute()))
            } else {
                if isLessThanOneWeek {
                    Text(date.formatted(.dateTime.weekday(.wide).hour().minute()))
                } else {
                    if isLessThanOneYear {
                        Text(date.formatted(.dateTime.month().day()))
                    } else {
                        Text(date.formatted(.dateTime.year().month().day()))
                    }
                }
            }
        }
    }
}

struct DateView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            DateView(date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 365)) // 1 year ago
            DateView(date: Date(timeIntervalSinceNow: -60 * 60 * 24 * 7))   // 1 week ago
            DateView(date: Date(timeIntervalSinceNow: -60 * 60 * 24))       // 1 day ago
            DateView(date: Date(timeIntervalSinceNow: -60 * 60))            // 1 hour ago
            DateView(date: Date(timeIntervalSinceNow: -60))                 // 1 minute ago
            DateView(date: Date())                                          // Now
        }

    }
}
