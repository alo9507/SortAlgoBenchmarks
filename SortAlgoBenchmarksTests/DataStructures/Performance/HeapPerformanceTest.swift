//
//  HeapPerformanceTest.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest

@testable import SortAlgoBenchmarks

class HeapPerformanceTests: XCTestCase {
    func testHeapInitialization() {
        Utils.timeElapsed("HEAP INITIALIZATION: 10,000") {
            let heap = Heap(TestFixtures.tenThousand_random, areSorted: >)
        }
    }
    
    // BEST CASE: O(log n)
    // WORST CASE: O(log n) The new root must be swapped all the way to the bottom of the tree
    func testRootRemoval() {
        var heap = Heap(TestFixtures.tenThousand_random, areSorted: >)
        
        Utils.timeElapsed("HEAP ROOT REMOVAL: 10,000") {
            heap.removeRoot()
        }
        
        Utils.timeElapsed("ARRAY ROOT REMOVAL: 10,000") {
            TestFixtures.tenThousand_random.removeFirst()
        }
    }
    
    // BEST AND AVERAGE CASE: O(1) (half the tree is at the leaves, so 50% it belongs there, decrease up the tree. Very unlikely to be the new root)
    // WORST CASE: O(log n)
    func testHeapInsertion() {
        var heap = Heap(TestFixtures.tenThousand_random, areSorted: >)
        Utils.timeElapsed("HEAP INSERTION: 10,000") {
            heap.insert(500)
        }
    }
}
