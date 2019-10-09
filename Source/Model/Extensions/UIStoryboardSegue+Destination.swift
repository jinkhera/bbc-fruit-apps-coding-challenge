//
//  UIStoryboardSegue+Destination.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

extension UIStoryboardSegue {
    
    /// - returns:  The intended `UIViewController` from the segue's destination.
    var intendedDestinationViewController: UIViewController {
        if let navigationController = self.destination as? UINavigationController {
            return navigationController.topViewController!
        }
        return self.destination
    }
}
