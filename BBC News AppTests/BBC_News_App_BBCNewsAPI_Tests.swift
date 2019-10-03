//
//  BBC_News_App_BBCNewsAPI_Tests.swift
//  BBC News AppTests
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import XCTest
@testable import BBC_News_App

class BBC_News_App_BBCNewsAPI_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDownloadHeadlines() {
        // Create an expectation for a API call.
        let expectation = XCTestExpectation(description: "Fetch headlines")
        
        BBCNews.loadHeadlines { (headlines, error) in
            if error != nil {
                XCTFail(error!.localizedDescription)
            }
            else  {
                print(headlines)
            }
            // Fulfill the expectation to indicate that the background task has finished successfully.
            expectation.fulfill()
        }
        
        // Wait until the expectation is fulfilled, with a timeout of 10 seconds.
        wait(for: [expectation], timeout: 10.0)
    }
    
}
