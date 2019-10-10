//
//  FruitViewDelegate.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

protocol FruitTableViewControllerDelegate {
    func didSelectFruit(_ fruit: Fruit, atIndex index: IndexPath)
}

class FruitTableViewDelegate: NSObject, UITableViewDelegate {
    // MARK: - vars
    var data = [Fruit]()
    
    var delegate: FruitTableViewControllerDelegate?
    
    // MARK: initialiser
    required init(tableView: UITableView, data: [Fruit]) {
        super.init()
        self.data = data
        self.configure(tableView: tableView)
    }
    
    // MARK: - private methods
    private func configure(tableView: UITableView) {
        tableView.delegate = self
    }
    
    // MARK: - update datasource
    func update(data: [Fruit]) {
        self.data.removeAll()
        self.data = data.sorted(by: { (a, b) -> Bool in
            a.type < b.type
        })
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let fruit = data[indexPath.row]
        delegate?.didSelectFruit(fruit, atIndex: indexPath)
    }
}
