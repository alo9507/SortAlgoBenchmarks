//
//  LinkedList.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/26/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//


import XCTest

@testable import SortAlgoBenchmarks

class LinkedListTests: XCTestCase {
    func test_print() {
        let linkedList: LinkedList<Int> = {
            let ll = LinkedList<Int>()
            ll.append(5)
            ll.append(10)
            return ll
        }()
        
        XCTAssertEqual(linkedList.description, "[5, 10]")
    }
    
    func test_count() {
        let linkedList: LinkedList<Int> = {
            let ll = LinkedList<Int>()
            ll.append(5)
            ll.append(10)
            return ll
        }()
        
        XCTAssertEqual(2, linkedList.count)
    }
    
    func test_reverse() {
        let linkedList: LinkedList<Int> = {
            let ll = LinkedList<Int>()
            ll.append(5)
            ll.append(10)
            ll.append(15)
            return ll
        }()
        
        linkedList.reverse_singly()
        
        XCTAssertEqual(linkedList.description, "[15, 10, 5]")
    }
}
