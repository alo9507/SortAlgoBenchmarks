//
//  MaxSumOfSubarray.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class MaxSumOfSubarrayTests: XCTestCase {
    func test_returnsMaxOfFullArray() {
        let testArray = [0,1,2,3,4,5]
        XCTAssertEqual(12, maxSubArray(testArray, 3))
    }
    
    func test_returnsMaxOfFullArray_optimized() {
        let testArray = [0,1,2,3,4,5]
//        XCTAssertEqual(12, maxSubArray_optimized(testArray, 1))
    }
}
