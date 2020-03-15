//
//  HeapTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest

@testable import SortAlgoBenchmarks

class HeapTests: XCTestCase {
    private let unsortedInts = [1,12,3,4,1,6,8,7]
    
    func test_init() {
        let heap = Heap(unsortedInts, areSorted: <)
        XCTAssertEqual(unsortedInts.sorted(by: >), Array(heap))
    }
    
    func testHeapInitialization() {
        var heap = Heap([5,3,4,2], areSorted: >)
        
        XCTAssertEqual(heap.pop(), 5)
        XCTAssertEqual(heap.pop(), 4)
    }
    
    func testInsertion() {
        var heap = Heap([5,3,4,2], areSorted: >)
        heap.push(20)
        XCTAssertEqual(heap.pop(), 20)
        
        heap.push(1)
        heap.push(7)
        heap.push(6)
        XCTAssertEqual([1,2,3,4,5,6,7][5], Array(heap)[5])
    }
    
    func testRemoval() {
        var heap = Heap([5,3,4,2], areSorted: >)
        heap.push(20)
        XCTAssertEqual(heap.pop(), 20)
    }
    
    func test_remove_at_index() {
        var heap = Heap(unsortedInts, areSorted: >)
        let index = heap.getFirstIndex(of: 3)!
        XCTAssertEqual(heap.remove(at: index), 3)
        
        heap.push(20)
        XCTAssertEqual(heap.pop(), 20)
    }
    
}
