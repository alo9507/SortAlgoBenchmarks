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
        let root = BinaryNode("God");
        root.leftChild = BinaryNode("Mother");
        root.rightChild = BinaryNode("Father");
        root.leftChild?.leftChild = BinaryNode("Child1");
        root.rightChild?.leftChild = BinaryNode("Child2");
        root.rightChild?.rightChild = BinaryNode("Child3");
        XCTAssertEqual([["God"], ["Mother", "Father"], ["Child1", "Child2", "Child3"]], root.bfs())
    }
    
    func test_reverseBfs() {
        let root = BinaryNode(1);
        root.leftChild = BinaryNode(2);
        root.rightChild = BinaryNode(3);
        root.leftChild?.leftChild = BinaryNode(4);
        root.rightChild?.leftChild = BinaryNode(5);
        root.rightChild?.rightChild = BinaryNode(6);
        XCTAssertEqual([[4,5,6], [2,3], [1]], root.reverseBfs())
    }
    
    func test_zigZag() {
        var root = BinaryNode(12);
        root.leftChild = BinaryNode(7);
        root.rightChild = BinaryNode(1);
        root.leftChild?.leftChild = BinaryNode(9);
        root.rightChild?.leftChild = BinaryNode(10);
        root.rightChild?.rightChild = BinaryNode(5);
        root.rightChild?.leftChild?.leftChild = BinaryNode(20);
        root.rightChild?.leftChild?.rightChild = BinaryNode(17);
        
        XCTAssertEqual([[12], [1, 7], [9, 10, 5], [17, 20]], root.zigZag())
        
        print(root.zigZag())
    }
    
    
    func test_averages() {
        var root = BinaryNode(12);
        root.leftChild = BinaryNode(7);
        root.rightChild = BinaryNode(1);
        root.leftChild?.leftChild = BinaryNode(9);
        root.leftChild?.rightChild = BinaryNode(2);
        root.rightChild?.leftChild = BinaryNode(10);
        root.rightChild?.rightChild = BinaryNode(5);
        
        // not sure why this isnt working. could be the data?
        XCTAssertEqual([12.0, 4.0, 6.0], root.levelAverages())
    }
    
    func test_dfsFindSumPath() {
        var root = BinaryNode(12);
        root.leftChild = BinaryNode(7);
        root.rightChild = BinaryNode(1);
        root.leftChild?.leftChild = BinaryNode(9);
        root.rightChild?.leftChild = BinaryNode(10);
        root.rightChild?.rightChild = BinaryNode(5);
        
        XCTAssertEqual(true, root.hasSumPath(root, 23))
        XCTAssertEqual(false, root.hasSumPath(root, 16))
    }
    
    func test_dfsFindAllPaths() {
        var root = BinaryNode(12);
        root.leftChild = BinaryNode(7);
        root.rightChild = BinaryNode(1);
        root.leftChild?.leftChild = BinaryNode(4);
        root.rightChild?.leftChild = BinaryNode(10);
        root.rightChild?.rightChild = BinaryNode(5);
        
        XCTAssertEqual([[12, 7, 4], [12, 1, 10]], root.findPaths(root, 23))
    }
    
    func test_search() {
        var root = BinaryNode(10);
        root.leftChild = BinaryNode(5);
        root.rightChild = BinaryNode(14);
        root.leftChild?.leftChild = BinaryNode(1);
        root.rightChild?.leftChild = BinaryNode(11);
        root.rightChild?.rightChild = BinaryNode(20);
        
        XCTAssertEqual(true, root.search(node: root, searchValue: 5))
        XCTAssertEqual(false, root.search(node: root, searchValue: 43))
    }
}
