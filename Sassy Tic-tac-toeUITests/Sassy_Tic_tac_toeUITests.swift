//
//  Sassy_Tic_tac_toeUITests.swift
//  Sassy Tic-tac-toeUITests
//
//  Created by Christopher Geleske on 7/2/15.
//  Copyright © 2015 Christopher Geleske. All rights reserved.
//

import Foundation
import XCTest

class Sassy_Tic_tac_toeUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
}