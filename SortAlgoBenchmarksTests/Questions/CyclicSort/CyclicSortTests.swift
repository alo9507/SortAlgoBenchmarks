//
//  CyclicSortTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/7/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class CyclicSortTests: XCTestCase {
    func test_cyclicSort() {
        var testArray = [3,2,1,5,4,6]
        cyclicSort(&testArray)
        XCTAssertEqual([1,2,3,4,5,6], testArray)
    }
    
    func test_findMissingNumber() {
        var testArray = [4,0,3,1]
//        XCTAssertEqual(2, findMissingNumber(testArray))
    }
}
