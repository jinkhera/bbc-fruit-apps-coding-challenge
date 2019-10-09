//
//  HeadlinesDatasource.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

class HeadlinesDatasource: NSObject, UITableViewDataSource {
    // MARK: - Types
    
    struct CellIdentifiers {
        static let headlines = "headlinesTableViewCell"
    }
    
    // MARK: - vars
    var headlines = [Headline]()
    
    // MARK: initialiser
    required init(tableView: UITableView, headlines: [Headline]) {
        super.init()
        self.headlines = headlines
        configure(tableView: tableView)
    }
    
    // MARK: - private methods
    private func configure(tableView: UITableView) {
        tableView.dataSource = self
    }
    
    // MARK: - update datasource
    func update(headlines: [Headline]) {
        self.headlines.removeAll()
        self.headlines = headlines.sorted(by: { (a, b) -> Bool in
            a.updated > b.updated
        })
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.headlines.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.headlines, for: indexPath)
        let headline = headlines[indexPath.row]
        cell.textLabel?.text = headline.headline
        cell.detailTextLabel?.text = headline.formattedDate
        return cell
    }
}
