//
//  HeapTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest

@testable import SortAlgoBenchmarks

class HeapTests: XCTestCase {
    func test() {
        var heap = Heap([5,3,4,2], areSorted: >)
        
        XCTAssertEqual(heap.removeRoot(), 5)
        XCTAssertEqual(heap.removeRoot(), 4)
    }
}
