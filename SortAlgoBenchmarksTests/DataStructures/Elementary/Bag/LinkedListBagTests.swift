//
//  BagTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/28/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class LinkedListBagTests: XCTestCase {
    func test_bag() {
        var bag = LinkedListBag<Int>()
        
        bag.add(0)
        bag.add(1)
        bag.add(2)
        bag.add(3)
        
        XCTAssertTrue(bag.contains(0))
        XCTAssertFalse(bag.contains(23))
        XCTAssertEqual(4, bag.size)
    }
}



