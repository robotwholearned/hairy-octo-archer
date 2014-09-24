//
//  Year.swift
//  Leap
//
//  Created by Sandquist, Cassandra G on 9/23/14.
//  Copyright (c) 2014 robotwholearned. All rights reserved.
//

import Foundation

class Year: NSObject {
    
    var year: Int
    var isLeapYear: Bool {
        return year % 4 == 0 && year % 100 != 0 || year % 400 == 0
    }
    
    init(calendarYear: Int) {
        year = calendarYear
        super.init()
    }
}