//
//  BBCNewsDecoder.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

struct BBCNewsDecoder {
    static func decodeJSON<T: Decodable>(data: Data, type: T.Type) throws -> T? {
        let decoder = JSONDecoder()
        do {
            let decoded: T? = try decoder.decode(T.self, from: data)
            return decoded
        } catch let e {
            throw APIError.generic("Invalid JSON \(T.self) \(e.localizedDescription)")
        }
    }
}
