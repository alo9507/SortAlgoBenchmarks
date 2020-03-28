//
//  KeyIndexedCountingTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/27/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class KeyIndexedCountingTests: XCTestCase {
    
    var testArray: [Int] = []
    var sortedArray: [Int] = [0,1,2,3,4,5,6,7,8,9]
    
    override func setUp() {
        testArray = [4,6,5,3,7,2,8,9,1,0]
    }
    
    func testCountingSort() {
        XCTAssertEqual(sortedArray, keyIndexedCounting(&testArray, in: 0...9))
    }
}
