//
//  nTreeTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class nTreeTests: XCTestCase {
    func test_nTreePrint() {
        var testInput: [Relation] = []
        testInput.append(Relation(parent: "animal", child: "mammal"))
        testInput.append(Relation(parent: "animal", child: "bird"))
        
        testInput.append(Relation(parent: "lifeform", child: "animal"))
        testInput.append(Relation(parent: "cat", child: "lion"))
        
        testInput.append(Relation(parent: "mammal", child: "cat"))
        testInput.append(Relation(parent: "animal", child: "fish"))
        
        printTree(testInput)
    }
}
