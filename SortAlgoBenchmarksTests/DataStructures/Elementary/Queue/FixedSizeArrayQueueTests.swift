//
//  FixedSizeArrayQueueTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class FixedSizeArrayQueueTests: XCTestCase {
    var empty = FixedSizeArrayQueue<Int>()
    var one = FixedSizeArrayQueue<Int>()
    var many = FixedSizeArrayQueue<Int>()
    
    override func setUp() {
        super.setUp()
        empty = FixedSizeArrayQueue<Int>()
        one = FixedSizeArrayQueue<Int>()
        many = FixedSizeArrayQueue<Int>()
    }
    
    func test_isEmpty() {
    }
    
    func test_count() {

    }
    
    func test_peek() {

    }
    
    func test_dequeue() {

    }
}
