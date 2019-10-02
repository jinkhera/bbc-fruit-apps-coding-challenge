//
//  Headline.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

// MARK: - Struct describing the 'Headline' model. Implements the Decodable protocol
//
struct Headline: Decodable {
    // MARK: - vars
    var headline: String
    var updated: Date
    var introduction: String
    
    // MARK: - initialiser
    public init(headline: String, updated: Date, introduction: String) {
        self.headline = headline
        self.updated = updated
        self.introduction = introduction
    }
}
