//
//  DateFormatter+Formatters.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

extension DateFormatter {
    static let ddMMMMyyyy: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "dd MMMM yyyy"
        return df
    }()
}
