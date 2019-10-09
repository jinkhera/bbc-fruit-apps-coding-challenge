//
//  HeadlineDetailsViewController.swift
//  BBC News App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

class HeadlineDetailsViewController: UIViewController {
    
    // MARK: - vars
    @IBOutlet weak var textView: UITextView!
    
    var headline: Headline?
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let title = (self.headline?.headline)!
        let introduction = (self.headline?.introduction)!
        textView.text = "\(title) \n\n\(introduction)"
        navigationItem.title = headline?.formattedDate
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let property = EventProperty(name: "display", value: "HeadlineDetails")
        let info = EventProperty(name: "headline", value: headline?.headline ?? "Unknown")
        BBCAnalytics.trackEvent(event: .display, metaData: [property, info])
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
