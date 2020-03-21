//
//  KWayMerge.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func kwayMerge(_ lists: LinkedListNode<Int>?...) -> LinkedListNode<Int>? {
    var minHeap: Heap<LinkedListNode<Int>> = Heap([]) { (node1, node2) -> Bool in
        return node1.value < node2.value
    }
    
    for root in lists {
        if root != nil {
            minHeap.push(root!)
        }
    }
    
    var resultHead: LinkedListNode<Int>? = nil
    var resultTail: LinkedListNode<Int>? = nil
    
    while !minHeap.isEmpty {
        let node = minHeap.pop()
        
        if resultHead == nil {
            resultHead = node
            resultTail = node
        } else {
            resultTail?.next = node
            resultTail = resultTail?.next
        }
        if node?.next != nil {
            minHeap.push(node!.next!)
        }
    }
    
    return resultHead
}

/*
 Given M sorted arrays
 Find the K'th smallest number among all arrays
 */

// brute force
func findKthSmallestElement_bruteForce(_ k: Int, _ arrays: [Int]...) -> Int {
    var merged: [Int] = []
    
    // create an array of unique elements from the array
    for array in arrays {
        for element in array {
            if !merged.contains(element) {
                merged.append(element)
            }
        }
    }
    
    var minHeap: Heap<Int> = Heap(merged, areSorted: <)
    
    var kthSmallest: Int = 0
    for _ in stride(from: 0, to: k, by: 1) {
        kthSmallest = minHeap.pop()!
    }
    
    return kthSmallest
}

// use this to keep track of the element and array index that a particular value came from
class ArrayNode: Equatable {
    var elementIndex: Int
    var arrayIndex: Int
    
    init(_ elementIndex: Int, _ arrayIndex: Int) {
        self.elementIndex = elementIndex
        self.arrayIndex = arrayIndex
    }
    
    static func == (lhs: ArrayNode, rhs: ArrayNode) -> Bool {
        return lhs.elementIndex == rhs.elementIndex && lhs.arrayIndex == rhs.arrayIndex
    }
}

func findKthSmallestElement(_ k: Int, _ arrays: [Int]...) -> Int {
    var minHeap: Heap<ArrayNode> = Heap([], areSorted: {(arrayNode1, arrayNode2) in
        return arrays[arrayNode1.arrayIndex][arrayNode1.elementIndex] < arrays[arrayNode2.arrayIndex][arrayNode2.elementIndex]
    })
    
    for i in stride(from: 0, through: arrays.count - 1, by: 1) {
        minHeap.push(ArrayNode(0, i))
    }
    
    // take the smallest (i.e. top) element from the min heap
    // if the running count is equal to k then return the number
    var numberCount = 0
    var number = 0
    while !minHeap.isEmpty {
        let arrayNode = minHeap.pop()
        
        let elementIndex = arrayNode!.elementIndex
        let arrayIndex = arrayNode!.arrayIndex
        number = arrays[arrayIndex][elementIndex]
        
        numberCount += 1
        if (numberCount == k) {
            break
        }
        
        arrayNode!.elementIndex += 1
        // if the array of the top element has more elements, add the next element to the heap
        if arrays[arrayIndex].count > arrayNode!.elementIndex {
            minHeap.push(arrayNode!)
        }
    }
    
    return number
}
