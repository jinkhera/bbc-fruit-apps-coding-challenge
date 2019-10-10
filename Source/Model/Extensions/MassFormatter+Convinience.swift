//
//  MassFormatter+Convinience.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 10/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import Foundation

extension MassFormatter {
    static let kgs: MassFormatter = {
        let f = MassFormatter()
        f.isForPersonMassUse = false
        f.unitStyle = .medium
        return f
    }()
}
