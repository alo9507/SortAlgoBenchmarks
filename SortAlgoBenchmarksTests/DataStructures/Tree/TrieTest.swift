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
    func test_trie() {
        var trie = Trie()
        trie.insert(word: "cat")
        trie.insert(word: "dog")
        
        XCTAssertTrue(trie.contains(word: "dog"))
        XCTAssertFalse(trie.contains(word: "blarg"))
    }
}
