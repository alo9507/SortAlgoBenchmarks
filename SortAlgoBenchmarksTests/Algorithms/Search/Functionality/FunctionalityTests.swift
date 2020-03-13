//
//  FunctionalityTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class FunctionalityTests: XCTestCase {
    var testArray: [Int] = []
    var sortedArray: [Int] = [1,2,3,4,5,6,7,8,9,10]
    
    override func setUp() {
        testArray = [10,4,6,5,3,7,2,8,9,1]
    }

    func testBinarySearch() {
        XCTAssertEqual(sortedArray.recursiveBinarySearch(for: 5), 4)
        XCTAssertEqual(sortedArray.recursiveBinarySearch(for: 10), 9)
    }
}

