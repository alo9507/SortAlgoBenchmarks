//
//  PriorityQueueTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import XCTest
@testable import SortAlgoBenchmarks

final class PriorityQueueTests: XCTestCase {
    func test() {
        let priorityQueue = PriorityQueue(TestFixtures.tenThousand_random, areSorted: <)
        XCTAssertEqual(priorityQueue.map { $0 }, TestFixtures.tenThousand_random.sorted())
    }
}
