//
//  SubsetsTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class SubsetsTests: XCTestCase {
    func test_subsets() {
        let testArray = [1,3]
        let testArray2 = [1, 5, 3]
        XCTAssertEqual([[], [1], [3], [1,3]], allDistinctSubsets(testArray))
        XCTAssertEqual([[], [1], [5], [1, 5], [3], [1, 3], [5, 3], [1, 5, 3]], allDistinctSubsets(testArray2))
    }
}
