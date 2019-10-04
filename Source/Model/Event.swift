//
//  Event.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

enum EventType: String {
    case load = "load"
    case display = "display"
}

typealias EventProperty = (name: String, value: Any)

// MARK: - Struct describing the 'Event' protocol
//
protocol Event {
    var event: EventType { get set }
    var metaData: [EventProperty] { get set }
    var date: Date { get set}
}

struct BBCAnalyticsEvent: Event, Equatable {
    
    // MARK: - vars
    var event: EventType
    var metaData: [EventProperty]
    var date: Date
    
    // conform to Equatable
    static func ==(lhs: BBCAnalyticsEvent, rhs: BBCAnalyticsEvent) -> Bool {
        return lhs.event == rhs.event && lhs.date == rhs.date
    }
}
