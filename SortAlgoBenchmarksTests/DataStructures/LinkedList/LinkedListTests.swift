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
    func test_append() {
        let linkedList: SinglyLinkedList<Int> = {
            let ll = SinglyLinkedList<Int>()
            ll.append(5)
            ll.append(10)
            ll.append(15)
            return ll
        }()
        
        XCTAssertEqual(5, linkedList.head?.value)
        XCTAssertEqual(15, linkedList.tail?.value)
    }
    
    
    func test_print() {
        let linkedList: SinglyLinkedList<Int> = {
            let ll = SinglyLinkedList<Int>()
            ll.append(5)
            ll.append(10)
            return ll
        }()
        
        XCTAssertEqual(linkedList.description, "[5, 10]")
    }
    
    func test_count() {
        let linkedList: SinglyLinkedList<Int> = {
            let ll = SinglyLinkedList<Int>()
            ll.append(5)
            ll.append(10)
            return ll
        }()
        
        XCTAssertEqual(2, linkedList.count)
    }
    
    func test_reverse() {
        let linkedList: SinglyLinkedList<Int> = {
            let ll = SinglyLinkedList<Int>()
            ll.append(5)
            ll.append(10)
            ll.append(15)
            return ll
        }()
        
        linkedList.reverse_singly()
        
        XCTAssertEqual(linkedList.description, "[15, 10, 5]")
    }
}
