//
//  HeadlinesTableViewDelegate.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

class HeadlinesTableViewDelegate: NSObject, UITableViewDelegate {
    // MARK: - vars
    var headlines = [Headline]()
    
    // MARK: initialiser
    required init(tableView: UITableView, headlines: [Headline]) {
        self.headlines = headlines
    }
    
    // MARK: - private methods
    private func configure(tableView: UITableView) {
        tableView.delegate = self
    }
}
