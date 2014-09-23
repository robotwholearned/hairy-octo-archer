//
//  LeapTests.swift
//  LeapTests
//
//  Created by Sandquist, Cassandra G on 9/23/14.
//  Copyright (c) 2014 robotwholearned. All rights reserved.
//

import XCTest

class LeapTest : XCTestCase {
    
    func testVanillaLeapYear() {
        let year = Year(calendarYear: 1996)
        XCTAssertTrue(year.isLeapYear);
    }
    
    func testAnyOldYear() {
        let year = Year(calendarYear: 1997)
        XCTAssertTrue(!year.isLeapYear);
    }
    
    func testCentury() {
        let year = Year(calendarYear: 1900)
        XCTAssertTrue(!year.isLeapYear);
    }
    
    func testExceptionalCentury() {
        let year = Year(calendarYear: 2400)
        XCTAssertTrue(year.isLeapYear);
    }
    
}