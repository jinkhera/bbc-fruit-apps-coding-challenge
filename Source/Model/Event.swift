//
//  Event.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

// MARK: - Struct describing the 'Event' model. Implements the Codable protocol
//
protocol Event {
    // MARK: - vars
    var event: String { get set }
}

struct NetworkEvent: Event {
    var event: String

}

struct ActionEvent: Event {
    var event: String
}
