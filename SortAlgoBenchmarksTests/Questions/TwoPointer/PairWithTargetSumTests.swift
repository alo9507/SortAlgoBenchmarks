//
//  PairWithTargetSumTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class PairWithTargetSumTests: XCTestCase {
    func test_pairWithTargetSum() {
        XCTAssertEqual([1,3], pairWithTargetSum_hash([1,2,3,4,6], 6))
        XCTAssertEqual([-1,-1], pairWithTargetSum_hash([1,2,3,4,6], 1000))
    }
}
