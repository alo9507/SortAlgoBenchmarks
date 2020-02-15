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
    
    func testRootRemoval() {
        var heap = Heap(TestFixtures.tenThousand_random, areSorted: >)
        
        Utils.timeElapsed("HEAP ROOT REMOVAL: 10,000") {
            heap.removeRoot()
        }
        
        Utils.timeElapsed("ARRAY ROOT REMOVAL: 10,000") {
            TestFixtures.tenThousand_random.removeFirst()
        }
    }
}
