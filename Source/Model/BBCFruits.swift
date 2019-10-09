//
//  BBCFruits.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

struct BBCFruits {
    
}

extension BBCFruits {
    static func loadFruits(_ completion: @escaping (Fruits?, APIError?) -> ()) {
        BBCFruitsAPI.get(endpoint: "data.json", type: Fruits.self) { (fruits, error) in
            // TODO: - Store locally in core data, sqlite, etc.....
            completion(fruits, error)
        }
    }
}
