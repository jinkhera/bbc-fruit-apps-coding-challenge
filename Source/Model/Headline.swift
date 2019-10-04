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
struct Headline: CustomStringConvertible {

    // MARK: - vars
    var headline: String
    var updated: Date
    var introduction: String
    
    var formattedDate: String {
        return DateFormatter.ddMMMMyyyy.string(from: updated)
    }

    // MARK: -
    var description: String {
        return "\(headline) : \(formattedDate)"
    }
    
    // MARK: - initialiser
    public init(headline: String, updated: Date, introduction: String) {
        self.headline = headline
        self.updated = updated
        self.introduction = introduction
    }
}

extension Headline: Decodable {
    private enum CodingKeys: String, CodingKey {
        case headline
        case updated
        case introduction
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        headline = try container.decode(String.self, forKey: .headline)
        introduction = try container.decode(String.self, forKey: .introduction)
        
        let timeFromEpoch = try container.decode(TimeInterval.self, forKey: .updated)
        let date = Date(timeIntervalSince1970: timeFromEpoch)
        updated = date
    }
}

struct Headlines: Decodable {
    let headlines : [Headline]
    
    enum CodingKeys: String, CodingKey {
       case headlines
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        headlines = try container.decode([Headline].self, forKey: .headlines)
    }
}
