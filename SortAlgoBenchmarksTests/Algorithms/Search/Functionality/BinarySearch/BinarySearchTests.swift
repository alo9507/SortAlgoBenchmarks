//
//  UnknownOrderingTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

class BinarySearchTests: XCTestCase {
    func test_orderAgnosticBinarySearch() {
        let array = [1,2,3,4,5,6,7,8,9]
        XCTAssertEqual(4,orderAgnosticBinarySearch(for: 5, array: array))
        XCTAssertEqual(8,orderAgnosticBinarySearch(for: 9, array: array))
        XCTAssertEqual(-1,orderAgnosticBinarySearch(for: 50, array: array))
        XCTAssertEqual(6,orderAgnosticBinarySearch(for: 3, array: array.reversed()))
    }
}
