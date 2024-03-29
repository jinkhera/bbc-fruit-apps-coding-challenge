//
//  BBC_Fruits_App_Model_Tests.swift
//  BBC Fruits AppTests
//
//  Created by Jatinder Pal Singh Khera on 02/10/2019.
//  Copyright © 2019 Jatinder Pal Singh Khera. All rights reserved.
//

import XCTest
@testable import BBC_Fruits_App

class BBC_Fruits_App_Model_Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConstructFruit() {
        let type = "apple"
        let price = 149.0
        let weight = 120.0
        let fruit = Fruit(type: type, price: price, weight: weight)
        
        let expected = "\(type) : \(price) : \(weight)"
        let result = fruit.description
        print(result)
        XCTAssert(expected == result, "Test failed: tell me what you want")
    }
}
