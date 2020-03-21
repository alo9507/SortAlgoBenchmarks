//
//  FinCycleInLinkedListTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation
import XCTest

@testable import SortAlgoBenchmarks

class FindCycleInLinkedListTests: XCTestCase {
    func test_FindCycleInLinkedList() {
        let head_withCycle = LinkedListNode<Int>(0)
        let beginCycle = LinkedListNode<Int>(1)
        head_withCycle.next = beginCycle
        head_withCycle.next?.next = LinkedListNode<Int>(2)
        head_withCycle.next?.next?.next = LinkedListNode<Int>(3)
        
        let cycleNode = LinkedListNode<Int>(4)
        cycleNode.next = beginCycle
        head_withCycle.next?.next?.next?.next = cycleNode
        
        XCTAssertTrue(hasCycle(head_withCycle))
        
        let head_noCycle = LinkedListNode<Int>(0)
        head_noCycle.next = LinkedListNode<Int>(1)
        head_noCycle.next?.next = LinkedListNode<Int>(2)
        XCTAssertFalse(hasCycle(head_noCycle))
    }
    
    func test_lengthOfCycle() {
        let head_withCycle = LinkedListNode<Int>(0)
        let beginCycle = LinkedListNode<Int>(1)
        head_withCycle.next = beginCycle
        head_withCycle.next?.next = LinkedListNode<Int>(2)
        head_withCycle.next?.next?.next = LinkedListNode<Int>(3)
        let cycleNode = LinkedListNode<Int>(4)
        cycleNode.next = beginCycle
        head_withCycle.next?.next?.next?.next = cycleNode
        
//        XCTAssertEqual(4, cycleLength(head_withCycle))
    }
    
    func test_inplaceReversalOfLinkedList() {
        let head = LinkedListNode<Int>(0)
        head.next = LinkedListNode<Int>(1)
        head.next?.next = LinkedListNode<Int>(2)
        
        XCTAssertEqual(2, inplaceReversalOfLinkedList(head).value)
    }
}

