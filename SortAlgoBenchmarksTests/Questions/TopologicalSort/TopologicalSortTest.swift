//
//  TopologicalSortTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class TopologicalSortTest: XCTestCase {
    func test_topologicalSort() {
        let result = AdjacencyList<Int>.topologicalSort(4, [[ 3, 2 ], [ 3, 0 ], [ 2, 0 ], [ 2, 1 ]])
        print(result)
    }
}

