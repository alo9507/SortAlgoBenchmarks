//
//  BinarySearchTreeTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class BinarySearchTreeTests: XCTestCase {
    func test_insert() {
        var bst = BinarySearchNode<Int>(10)
        
        bst.insert(5)
        bst.insert(6)
        bst.insert(4)
        bst.insert(11)
        
        XCTAssertEqual(5, bst.search(5)?.value)
    }
}
