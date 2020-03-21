//
//  ArrayStackTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class ArrayStackTests: XCTestCase {
    func test_arrayStack() {
        var stack = ArrayStack<Int>()
        
        XCTAssertEqual(nil, stack.pop())
        stack.push(0)
        stack.push(1)
        stack.push(2)
        stack.push(3)
        
        XCTAssertEqual(3, stack.peek)
        XCTAssertEqual(3, stack.pop())
        XCTAssertEqual(3, stack.count)
        
        XCTAssertEqual(2, stack.pop())
        XCTAssertEqual(2, stack.count)
        
        XCTAssertEqual(1, stack.pop())
        XCTAssertEqual(0, stack.pop())
        XCTAssertTrue(stack.isEmpty)
    }
}



