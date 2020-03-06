//
//  RemoveDuplicatesTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class RemoveDuplicatesTests: XCTestCase {
    func test_removeDuplicates() {
        var testArray = [0,0,1,1,2,2]
        var newLength = removeDuplicates(&testArray)
        XCTAssertEqual([0,1,2], testArray)
        XCTAssertEqual(3, newLength)
        
        testArray = [0,1,4]
        newLength = removeDuplicates(&testArray)
        XCTAssertEqual([0,1,4], testArray)
        XCTAssertEqual(3, newLength)
    }
    
    func test_removeAllInstancesOfKey() {
        
    }
}
