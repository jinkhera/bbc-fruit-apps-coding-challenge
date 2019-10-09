//
//  HeadlinesTableViewController.swift
//  BBC Fruits App
//
//  Created by Jatinder Pal Singh Khera on 04/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import UIKit

class HeadlinesTableViewController: UITableViewController, HeadlinesTableViewControllerDelegate {
    // MARK: - Types
    
    struct SegueIdentifiers {
        static let showHeadlineDetails = "showHeadlineDetailsSegue"
    }
    
    // MARK: - vars
    var datasource: HeadlinesDatasource?
    var delegate: HeadlinesTableViewDelegate?
    
    lazy var activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    // MARK: - view life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshControl?.addTarget(self, action: #selector(reloadTableView(sender:)), for: .valueChanged)
        
        datasource = HeadlinesDatasource(tableView: self.tableView, headlines: [Headline]())
        delegate = HeadlinesTableViewDelegate(tableView: self.tableView, headlines: [Headline]())
        delegate?.delegate = self
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 44.0
        
        refresh()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let property = EventProperty(name: "display", value: "Headlines")
        BBCAnalytics.trackEvent(event: .display, metaData: [property])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        guard let identifier = segue.identifier else {
            return
        }
        
        switch identifier {
        case SegueIdentifiers.showHeadlineDetails:
            if let destination = segue.intendedDestinationViewController as? HeadlineDetailsViewController {
                if let headline = sender as? Headline {
                    destination.headline = headline
                }
            }
        default:
            return
        }
    }
    
    // MARK: - show/hide activity indicators
    /// Hides activity indicator.
    func hideActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        navigationItem.rightBarButtonItem = nil
    }
    
    /// Temporarily shows an activity indicator.
    func showActivityIndicator() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: activityIndicator)
        activityIndicator.startAnimating()
    }
    
    // MARK: - pull to refresh
    @objc func reloadTableView(sender: UIRefreshControl) {
        self.refresh()
        refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    // MARK: - load headlines
    private func refresh() {
        loadHeadlines()
    }
    
    private func loadHeadlines() {
        self.showActivityIndicator()
        
        let message = NSLocalizedString("Checking for news headlines", comment: "Checking for news headlines")
        self.setBackgroundMessage(message)
        self.tableView.reloadData()
        
        BBCNews.loadHeadlines { (headlines, error) in
            // because it's the UI thread the GODS insist to do unto the main thread, meh
            DispatchQueue.main.async {
                if error != nil {
                    let message = NSLocalizedString("BBC News has no news today", comment: "BBC News has no news today")
                    self.setBackgroundMessage(message)
                }
                else  {
                    self.datasource?.update(headlines: (headlines?.headlines)!)
                    self.delegate?.update(headlines: (headlines?.headlines)!)
                    self.tableView.reloadData()
                }
                self.hideActivityIndicator()
                self.tableView.reloadData()
            }
        }
    }
    
    // MARK: - HeadlinesTableViewControllerDelegate
    func didSelectHeadline(_ headineline: Headline, atIndex index: IndexPath) {
        self.performSegue(withIdentifier: SegueIdentifiers.showHeadlineDetails, sender: headineline)
    }
}
