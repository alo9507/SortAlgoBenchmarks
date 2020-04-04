//
//  HashTableTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 4/4/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class SeparateChainingHashTableTests: XCTestCase {
    func test_separateChainingHashTable() {
        var hashTable = SeparateChainingHashTable<String, Int>()
        hashTable.insert("one", 1)
        hashTable.insert("two", 2)
        hashTable.insert("three", 3)
        
        XCTAssertEqual(hashTable.get("one"), 1)
        XCTAssertEqual(hashTable.get("two"), 2)
        XCTAssertEqual(hashTable.get("three"), 3)
    }
}
