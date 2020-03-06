//
//  SmallestSubarrayWithSum.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class SmallestSubarrayWithSumTests: XCTestCase {
    func test_SmallestSubarrayWithSum() {
        XCTAssertEqual(2, smallestSubarrayWithGivenSum(7, [2, 1, 5, 2, 3, 2]))
        XCTAssertEqual(1, smallestSubarrayWithGivenSum(7, [2, 1, 5, 2, 8]))
        XCTAssertEqual(3, smallestSubarrayWithGivenSum(8, [3, 4, 1, 1, 6]))
        XCTAssertEqual(0, smallestSubarrayWithGivenSum(1000, [3, 4, 1, 1, 6]))
    }
}
