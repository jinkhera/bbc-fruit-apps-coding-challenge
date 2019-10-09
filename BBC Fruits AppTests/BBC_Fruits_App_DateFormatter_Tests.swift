//
//  BBC_Fruits_App_DateFormatter_Tests.swift
//  BBC Fruits AppTests
//
//  Created by Jatinder Pal Singh Khera on 03/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import XCTest
@testable import BBC_Fruits_App

class BBC_Fruits_App_DateFormatter_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstructHeadline() {
        
        // -1489653159 (18 October 1922 date BBC founded)
        let timeFromEpoch = TimeInterval(-1489653159)
        let date = Date(timeIntervalSince1970: timeFromEpoch)
        let formattedDate = DateFormatter.ddMMMMyyyy.string(from: date)
        
        let expected = "18 October 1922"
        let result = formattedDate
        print(result)
        XCTAssert(expected == result, "Test failed: tell me what you want")
    }
}
