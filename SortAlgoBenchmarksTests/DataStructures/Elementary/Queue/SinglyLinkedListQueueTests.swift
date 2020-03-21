//
//  SinglyLinkedListQueueTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class SinglyLinkedListQueueTests: XCTestCase {
    func test_singlyLinkedListQueue() {
        var queue = SinglyLinkedListQueue<Int>()
        
        XCTAssertTrue(queue.isEmpty)
        
        queue.enqueue(0)
        queue.enqueue(1)
        XCTAssertEqual(2, queue.count)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(0, queue.peek)
        XCTAssertEqual(0, queue.dequeue())
        XCTAssertEqual(1, queue.dequeue())
        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(0, queue.count)
    }
}



