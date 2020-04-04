//
//  TrieTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class TrieTests: XCTestCase {
    func test_trieInsert() {
        var trie = Trie2()
        trie.insert(word: "abc")
        trie.insert(word: "bob")
        XCTAssertEqual(true, trie.contains(word: "abc"))
        XCTAssertEqual(false, trie.contains(word: "not"))
    }
}
