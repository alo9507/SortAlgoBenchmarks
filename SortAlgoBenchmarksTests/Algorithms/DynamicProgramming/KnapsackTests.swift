//
//  KnapsackTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/30/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

@testable import SortAlgoBenchmarks

import XCTest

class KnapsackTests: XCTestCase {
    func test_knapsack_bruteForce() {
        let maxProfit = knapsack_bruteForce([0,1,2], [0,1,2], 2)
        XCTAssertEqual(2, maxProfit)
    }
}
