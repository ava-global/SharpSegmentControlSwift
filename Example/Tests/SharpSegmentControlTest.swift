//
//  SharpSegmentControlTest.swift
//  SharpSegmentControlSwift_Tests
//
//  Created by nattapon on 24/6/2564 BE.
//  Copyright © 2564 BE CocoaPods. All rights reserved.
//

import XCTest
import SharpSegmentControlSwift

class SharpSegmentControlTest: XCTestCase {

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
        let rect = CGRect(x: 0,
                          y: 0,
                          width: 100,
                          height: 30)
        
        let control1 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1"],
                                           activeColor: .red,
                                           inactiveColor: .blue,
                                           radiusCornor: 2)
        
        XCTAssertEqual(control1.selectedIndex, 0)
        XCTAssertEqual(control1.activeColor, UIColor.red)
        XCTAssertEqual(control1.inactiveColor, UIColor.blue)
        XCTAssertEqual(control1.segmentButtons.count, 1)
        XCTAssertEqual(control1.segmentButtonCount, 1)
                    
        
        let control2 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1" , "btn2"],
                                           activeColor: .green,
                                           inactiveColor: .black,
                                           radiusCornor: 10)
        
        XCTAssertEqual(control2.selectedIndex, 0)
        XCTAssertEqual(control2.activeColor, UIColor.green)
        XCTAssertEqual(control2.inactiveColor, UIColor.black)
        XCTAssertEqual(control2.segmentButtons.count, 2)
        XCTAssertEqual(control2.segmentButtonCount, 2)
    }
    
    func testSetSelectedIndex() {
        let rect = CGRect(x: 0,
                          y: 0,
                          width: 100,
                          height: 30)
        
        let control1 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1"],
                                           activeColor: .red,
                                           inactiveColor: .blue,
                                           radiusCornor: 2)
        
        XCTAssertEqual(control1.selectedIndex, 0)
        XCTAssertEqual(control1.activeColor, UIColor.red)
        XCTAssertEqual(control1.inactiveColor, UIColor.blue)
        XCTAssertEqual(control1.segmentButtons.count, 1)
        XCTAssertEqual(control1.segmentButtonCount, 1)
        
        control1.selectSegmentIndex(0)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        control1.selectSegmentIndex(1)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        control1.selectSegmentIndex(2)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        control1.selectSegmentIndex(-1)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        control1.selectSegmentIndex(9999)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        control1.selectSegmentIndex(0)
        XCTAssertEqual(control1.selectedIndex, 0)
        
        let control2 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1" , "btn2" , "btn3" , "btn4"],
                                           activeColor: .red,
                                           inactiveColor: .blue,
                                           radiusCornor: 2)
        
        XCTAssertEqual(control2.selectedIndex, 0)
        XCTAssertEqual(control2.activeColor, UIColor.red)
        XCTAssertEqual(control2.inactiveColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons.count, 4)
        XCTAssertEqual(control2.segmentButtonCount, 4)
        
        control2.selectSegmentIndex(0)
        XCTAssertEqual(control2.selectedIndex, 0)
        
        control2.selectSegmentIndex(1)
        XCTAssertEqual(control2.selectedIndex, 1)
        
        control2.selectSegmentIndex(2)
        XCTAssertEqual(control2.selectedIndex, 2)
        
        control2.selectSegmentIndex(3)
        XCTAssertEqual(control2.selectedIndex, 3)
        
        control2.selectSegmentIndex(4)
        XCTAssertEqual(control2.selectedIndex, 3)
        
        control2.selectSegmentIndex(-1)
        XCTAssertEqual(control2.selectedIndex, 3)
        
        control2.selectSegmentIndex(9999)
        XCTAssertEqual(control2.selectedIndex, 3)
        
        control2.selectSegmentIndex(0)
        XCTAssertEqual(control2.selectedIndex, 0)
    }

    func testSetSelectedIndexSharpSide() {
        let rect = CGRect(x: 0,
                          y: 0,
                          width: 100,
                          height: 30)
        
        let control2 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1" , "btn2" , "btn3" , "btn4"],
                                           activeColor: .red,
                                           inactiveColor: .blue,
                                           radiusCornor: 2)
        
        XCTAssertEqual(control2.selectedIndex, 0)
        XCTAssertEqual(control2.activeColor, UIColor.red)
        XCTAssertEqual(control2.inactiveColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons.count, 4)
        XCTAssertEqual(control2.segmentButtonCount, 4)
        
        XCTAssertEqual(control2.segmentButtons[0].sharpSide, SharpButton.SharpSide.rightBottom)
        XCTAssertEqual(control2.segmentButtons[1].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[2].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[3].sharpSide, SharpButton.SharpSide.none)
        
        control2.selectSegmentIndex(1)
        XCTAssertEqual(control2.segmentButtons[0].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[1].sharpSide, SharpButton.SharpSide.bothBottom)
        XCTAssertEqual(control2.segmentButtons[2].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[3].sharpSide, SharpButton.SharpSide.none)
        
        control2.selectSegmentIndex(2)
        XCTAssertEqual(control2.segmentButtons[0].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[1].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[2].sharpSide, SharpButton.SharpSide.bothBottom)
        XCTAssertEqual(control2.segmentButtons[3].sharpSide, SharpButton.SharpSide.none)
        
        control2.selectSegmentIndex(3)
        XCTAssertEqual(control2.segmentButtons[0].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[1].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[2].sharpSide, SharpButton.SharpSide.none)
        XCTAssertEqual(control2.segmentButtons[3].sharpSide, SharpButton.SharpSide.leftBottom)
        
    }
        
    func testSetSelectedIndexSharpColor() {
        let rect = CGRect(x: 0,
                          y: 0,
                          width: 100,
                          height: 30)
        
        let control2 = SharpSegmentControl(frame: rect,
                                           btnTitles: ["btn1" , "btn2" , "btn3" , "btn4"],
                                           activeColor: .red,
                                           inactiveColor: .blue,
                                           radiusCornor: 2)
        
        XCTAssertEqual(control2.selectedIndex, 0)
        XCTAssertEqual(control2.activeColor, UIColor.red)
        XCTAssertEqual(control2.inactiveColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons.count, 4)
        XCTAssertEqual(control2.segmentButtonCount, 4)
        
        XCTAssertEqual(control2.segmentButtons[0].fillShapeColor, UIColor.red)
        XCTAssertEqual(control2.segmentButtons[1].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[2].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[3].fillShapeColor, UIColor.blue)
        
        control2.selectSegmentIndex(1)
        XCTAssertEqual(control2.segmentButtons[0].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[1].fillShapeColor, UIColor.red)
        XCTAssertEqual(control2.segmentButtons[2].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[3].fillShapeColor, UIColor.blue)
        
        control2.selectSegmentIndex(2)
        XCTAssertEqual(control2.segmentButtons[0].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[1].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[2].fillShapeColor, UIColor.red)
        XCTAssertEqual(control2.segmentButtons[3].fillShapeColor, UIColor.blue)
        
        control2.selectSegmentIndex(3)
        XCTAssertEqual(control2.segmentButtons[0].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[1].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[2].fillShapeColor, UIColor.blue)
        XCTAssertEqual(control2.segmentButtons[3].fillShapeColor, UIColor.red)
    }
}
