//
//  FruitDatasource.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

class FruitDatasource: NSObject, UITableViewDataSource {
    // MARK: - Types
    
    struct CellIdentifiers {
        static let fruit = "fruitTableViewCell"
    }
    
    // MARK: - vars
    var data = [Fruit]()
    
    // MARK: initialiser
    required init(tableView: UITableView, fruit: [Fruit]) {
        super.init()
        self.data = fruit
        configure(tableView: tableView)
    }
    
    // MARK: - private methods
    private func configure(tableView: UITableView) {
        tableView.dataSource = self
    }
    
    // MARK: - update datasource
    func update(data: [Fruit]) {
        self.data.removeAll()
        self.data = data.sorted(by: { (a, b) -> Bool in
            a.type > b.type
        })
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.fruit, for: indexPath)
        let fruit = data[indexPath.row]
        cell.textLabel?.text = fruit.type
        return cell
    }
}
