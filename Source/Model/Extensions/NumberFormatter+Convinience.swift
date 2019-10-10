//
//  NumberFormatter+Convinience.swift
//  BBC Fruits AppTests
//
//  Created by Jatinder Pal Singh Khera on 10/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

extension NumberFormatter {
    static let currencyUK: NumberFormatter = {
        let f = NumberFormatter()
        f.numberStyle = .currency
        let locale = Locale(identifier: "en_UK")
        f.locale = locale
        return f
    }()
}
