//
//  BBC_News_App_Model_Tests.swift
//  BBC News AppTests
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import XCTest
@testable import BBC_News_App

class BBC_News_App_Model_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstructHeadline() {
        let title = "Welcome to the BBC"
        // -1489653159 (18 October 1922 date BBC founded)
        let date = Date(timeIntervalSince1970: -1489653159)
        let introduction = "The BBC was founded on this date"
        let headline = Headline(headline: title, updated: date, introduction: introduction)
        
        let expected = "\(title) : 18 October 1922"
        let result = headline.description
        print(result)
        XCTAssert(expected == result, "Test failed: tell me what you want")
    }
}
