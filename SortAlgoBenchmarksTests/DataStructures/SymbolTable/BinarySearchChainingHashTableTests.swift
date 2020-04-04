//
//  BinarySearchChainingHashTableTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class BinarySearchChainingHashTableTests: XCTestCase {
    func test_binarySearchChainingHashTable() {
        var hashTable = BinarySearchChainingHashTable<String, Int>()
        hashTable.insert("one", 1)
        hashTable.insert("two", 2)
        hashTable.insert("three", 3)
        
        XCTAssertEqual(hashTable.get("one"), 1)
        XCTAssertEqual(hashTable.get("two"), 2)
        XCTAssertEqual(hashTable.get("three"), 3)
    }
}

