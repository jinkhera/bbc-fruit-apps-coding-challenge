//
//  BBCNews.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

struct BBCNews {
    
}

extension BBCNews {
    static func loadHeadlines(_ completion: @escaping (Headlines?, APIError?) -> ()) {
        BBCNewsAPI.get(endpoint: "headlines.json", type: Headlines.self) { (headlines, error) in
            // TODO: - Store locally in core data, sqlite, etc.....
            completion(headlines, error)
        }
    }
}
