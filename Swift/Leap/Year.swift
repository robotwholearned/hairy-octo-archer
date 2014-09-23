//
//  Year.swift
//  Leap
//
//  Created by Sandquist, Cassandra G on 9/23/14.
//  Copyright (c) 2014 robotwholearned. All rights reserved.
//

import Foundation

class Year: NSObject {
    
    var isLeapYear: Bool = false
    var year: Int
    
    init(calendarYear: Int) {
        year = calendarYear
        
        super.init()
        
        isLeapYear = validLeap()
    }
    
    func validLeap() -> Bool{
        if self.year % 4 == 0{
            if self.year % 100 == 0{
                if self.year % 400 == 0{
                    return true
                }
                return false
            }
            return true
        }
        return false
    }
    
}