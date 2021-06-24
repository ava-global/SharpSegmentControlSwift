//
//  SharpButtonTest.swift
//  SharpSegmentControlSwift_Tests
//
//  Created by nattapon on 24/6/2564 BE.
//  Copyright © 2564 BE CocoaPods. All rights reserved.
//

import XCTest
import SharpSegmentControlSwift

class SharpButtonTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testInit() {
        let btn = SharpButton(.init(x: 0,
                                    y: 0,
                                    width: 100,
                                    height: 30),
                              fillShapeColor: .red,
                              radiusCornor: 10,
                              sharpSide: .none)
        
        XCTAssertEqual(btn.radiusCornor, 10)
        XCTAssertEqual(btn.fillShapeColor, UIColor.red)
        XCTAssertEqual(btn.sharpSide, SharpButton.SharpSide.none)
    }
    
}

