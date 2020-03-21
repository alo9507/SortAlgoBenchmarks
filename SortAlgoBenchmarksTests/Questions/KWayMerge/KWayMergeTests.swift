//
//  KWayMergeTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class KWayMergeTests: XCTestCase {
    func test_kwayMerge() {
        let l1 = LinkedListNode(2);
        l1.next = LinkedListNode(6);
        l1.next?.next = LinkedListNode(8);
        
        let l2 = LinkedListNode(3);
        l2.next = LinkedListNode(6);
        l2.next?.next = LinkedListNode(7);

        let l3 = LinkedListNode(1);
        l3.next = LinkedListNode(3);
        l3.next?.next = LinkedListNode(4);
        
        var result: LinkedListNode? = kwayMerge(l1,l2,l3)
        var actualOrder: [Int] = []
        while result != nil {
            actualOrder.append(result!.value)
            print(result?.value ?? "")
            result = result?.next
        }
        XCTAssertEqual([1, 2, 3, 3, 4, 6, 6, 7, 8], actualOrder)
    }
    
    func test_kthSmallest() {
        let l1 = [2, 6, 8]
        let l2 = [3, 6, 7]
        let l3 = [1, 3, 4]
        
        XCTAssertEqual(2, findKthSmallestElement(2, l1,l2,l3))
    }
}
