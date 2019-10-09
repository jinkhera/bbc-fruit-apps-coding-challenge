//
//  HeadlinesTableViewDelegate.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

protocol HeadlinesTableViewControllerDelegate {
    func didSelectHeadline(_ headineline: Headline, atIndex index: IndexPath)
}

class HeadlinesTableViewDelegate: NSObject, UITableViewDelegate {
    // MARK: - vars
    var headlines = [Headline]()
    
    var delegate: HeadlinesTableViewControllerDelegate?
    
    // MARK: initialiser
    required init(tableView: UITableView, headlines: [Headline]) {
        super.init()
        self.headlines = headlines
        self.configure(tableView: tableView)
    }
    
    // MARK: - private methods
    private func configure(tableView: UITableView) {
        tableView.delegate = self
    }
    
    // MARK: - update datasource
    func update(headlines: [Headline]) {
        self.headlines.removeAll()
        self.headlines = headlines.sorted(by: { (a, b) -> Bool in
            a.updated > b.updated
        })
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let headline = headlines[indexPath.row]
        delegate?.didSelectHeadline(headline, atIndex: indexPath)
    }
}
