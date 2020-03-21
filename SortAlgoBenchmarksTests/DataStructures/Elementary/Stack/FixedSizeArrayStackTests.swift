//
//  FixedSizeArrayStackTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class FixedSizeArrayStackTests: XCTestCase {
    var empty = FixedSizeArrayStack<Int>()
    var one = FixedSizeArrayStack<Int>()
    var many = FixedSizeArrayStack<Int>()
    
    override func setUp() {
        super.setUp()
        empty = FixedSizeArrayStack<Int>()
        one = FixedSizeArrayStack<Int>()
        many = FixedSizeArrayStack<Int>()
        
        one.push(0)
        
        many.push(0)
        many.push(1)
        many.push(2)
    }
    
    func test_isEmpty() {
        // new stacks are empty
        XCTAssertEqual(true, empty.isEmpty)
    }
    
    func test_count() {
        // new stacks should have count of 0
        XCTAssertEqual(0, empty.count)
        
        // adding elements to a stack increases count
        XCTAssertEqual(1, one.count)
        
        // pop should decrease count
        XCTAssertEqual(3, many.count)
        many.pop()
        XCTAssertEqual(2, many.count)
    }
    
    func test_peek() {
        // peek should return nil for empty stack
        XCTAssertEqual(nil, empty.peek)
        
        // peek should return last pushed element element WITHOUT decreasing count
        XCTAssertEqual(1, one.count)
        XCTAssertEqual(0, one.peek)
        XCTAssertEqual(1, one.count)
    }
    
    func test_pop() {
        // pop should return last pushed element element
        XCTAssertEqual(0, one.pop())
        
        XCTAssertEqual(2, many.pop())
        XCTAssertEqual(1, many.pop())
        
        many.push(100)
        XCTAssertEqual(100, many.pop())
    }
}



