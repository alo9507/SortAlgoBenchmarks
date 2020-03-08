//
//  BinaryTreeTests.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//
import XCTest
@testable import SortAlgoBenchmarks

final class BinaryTreeTestCase: XCTestCase {
    var tree: BinaryNode<Int> = {
        let zero = BinaryNode(0)
        let one = BinaryNode(1)
        let five = BinaryNode(5)
        let seven = BinaryNode(7)
        let eight = BinaryNode(8)
        let nine = BinaryNode(9)
        
        seven.leftChild = one
        one.leftChild = zero
        one.rightChild = five
        seven.rightChild = nine
        nine.leftChild = eight
        
        return seven
    }()
    
    func test_visualizeBinaryTree() {
        print(tree.description)
    }
    
    func test_traverseInOrder() {
        var testArray: [Int] = []
        tree.traverseInOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0, 1, 5, 7, 8, 9])
    }
    
    func test_traversePreOrder() {
        var testArray: [Int] = []
        tree.traversePreOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [7, 1, 0, 5, 9, 8])
    }
    
    func test_traversePostOrder() {
        var testArray: [Int] = []
        tree.traversePostOrder { testArray.append($0) }
        XCTAssertEqual(testArray, [0, 5, 1, 8, 9, 7])
    }
    
    func test_bfs() {
        let root = BinaryNode(12);
        root.leftChild = BinaryNode(7);
        root.rightChild = BinaryNode(1);
        root.leftChild?.leftChild = BinaryNode(9);
        root.rightChild?.leftChild = BinaryNode(10);
        root.rightChild?.rightChild = BinaryNode(5);
        print(root.bfs())
    }
    
}
