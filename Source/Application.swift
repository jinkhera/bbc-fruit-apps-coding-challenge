//
//  Application.swift
//  BBC News AppTests
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

public struct Application {
    struct DateFormatters {
        static func defaultDateFormatter() -> DateFormatter {
            let df = DateFormatter()
            df.dateFormat = "dd MMMM yyyy"
            return df
        }
    }
}
