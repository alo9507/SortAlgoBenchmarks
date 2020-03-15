//
//  UnionFindTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

final class UnionFindTestCase: XCTestCase {
    func test_unionFind() {
        var unionFind = UnionFind<Int>()
        
        unionFind.addSetWith(0)
        unionFind.addSetWith(1)
        unionFind.addSetWith(2)
        
        unionFind.unionSetsContaining(0, and: 1)
        
        XCTAssertEqual(0, unionFind.setOf(1))
        
        unionFind.unionSetsContaining(1, and: 2)

        XCTAssertEqual(0, unionFind.setOf(2))
        
        print(unionFind.allSets())
    }
}
