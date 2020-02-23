//
//  Heap.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

// Full binary tree: every node (except the terminal leaves) has two children
// Complete binary tree:
//                      A) All but the last level has to be filled compeltely
//                      B) All nodes are as far left as possible
// Heap Invariant/Property: Value of a parent node must always be greater than or equal to the value of its children

struct Heap<Element: Equatable> {
    fileprivate var elements: [Element] = []
    let areSorted: (Element, Element) -> Bool
    
    init(_ elements: [Element], areSorted: @escaping (Element, Element) -> Bool) {
        self.areSorted = areSorted
        self.elements = elements
        
        guard !elements.isEmpty else {
            return
        }
        
        for index in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
            siftDown(from: index)
        }
    }
    
    func hasLeftChild(_ index: Int, upTo count: Int? = nil) -> Bool {
        let count = count ?? self.count
        
        return getChildIndices(ofParentAt: index).left < count
    }
    
    func hasRightChild(_ index: Int, upTo count: Int? = nil) -> Bool {
        let count = count ?? self.count
        
        return getChildIndices(ofParentAt: index).right < count
    }
    
    var isEmpty: Bool {
        return elements.isEmpty
    }
    
    var count: Int {
        return elements.count
    }
    
    func peek() -> Element? {
        return elements.first
    }
    
    // O(1) since arrays allow random access. Better than O(log n) of a binary tree
    func getChildIndices(ofParentAt parentIndex: Int) -> (left: Int, right: Int) {
        let leftIndex = (2 * parentIndex) + 1
        return (leftIndex, leftIndex + 1)
    }
    
    // The .5 left over for the left child is floored by integer division
    func getParentIndex(ofChildAt index: Int) -> Int {
        return (index - 1) / 2
    }
    
    mutating func removeRoot() -> Element? {
        guard !isEmpty else {
            return nil
        }

        // swap current root with final leaf
        elements.swapAt(0, count - 1)
        
        // remove original root
        let originalRoot = elements.removeLast()
        
        // sift down from new root
        siftDown(from: 0)
        
        return originalRoot
    }
    
    // since our heap is implemented with an array, search is O(n) not O(log n) like in binary search tree
    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        }
        else {
            elements.swapAt(index, elements.count - 1)
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }
            return elements.removeLast()
        }
    }
    
    // Enforces the heap invariant
    mutating func siftDown(from index: Int, upTo count: Int? = nil) {
        let count = count ?? self.count
        
        var parentIndex = index
        while true {
            // start each iteration by getting the index's children
            let (leftIndex, rightIndex) = getChildIndices(ofParentAt: parentIndex)
            
            // you may need to swap it with one if its children, so store the child index
            var optionalParentSwapIndex: Int?
            
            if hasLeftChild(parentIndex, upTo: count) && areSorted(elements[leftIndex], elements[parentIndex]) {
                 optionalParentSwapIndex = leftIndex
            }
            
            if hasRightChild(parentIndex, upTo: count) && areSorted(elements[rightIndex], elements[optionalParentSwapIndex ?? parentIndex]) {
                optionalParentSwapIndex = rightIndex
            }
            
            // If parent is already arranged properly with respect to its children, siftDown is complete
            guard let parentSwapIndex = optionalParentSwapIndex else {
                return
            }
            
            elements.swapAt(parentIndex, parentSwapIndex)
            parentIndex = parentSwapIndex
        }
    }
    
    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var childIndex = index
        var parentIndex = getParentIndex(ofChildAt: childIndex)
        while childIndex > 0 && areSorted(elements[childIndex], elements[parentIndex]) {
            // swap child with parent
            elements.swapAt(childIndex, parentIndex)
            
            // update the child index
            childIndex = parentIndex
            
            // get the new index's parent
            parentIndex = getParentIndex(ofChildAt: childIndex)
        }
    }
}

extension Array where Element: Equatable {
    init(_ heap: Heap<Element>) {
        var heap = heap
        
        // iteratively shrinks the unsorted region by extracting larges/smallest element and inserting it into the sorted region
        for index in heap.elements.indices.reversed() {
            heap.elements.swapAt(0, index)
            heap.siftDown(from: 0, upTo: index)
        }
        self = heap.elements
    }
    
    func isHeap(sortedBy areSorted: @escaping (Element, Element) -> Bool) -> Bool {
        if isEmpty {
            return true
        }
        
        for parentIndex in stride(from: count / 2 - 1, through: 0, by: -1) {
            let parent = self[parentIndex]
            let leftChildIndex = 2 * parentIndex + 1
            if areSorted(self[leftChildIndex], parent) {
                return false
            }
            let rightChildIndex = leftChildIndex + 1
            if rightChildIndex < count && areSorted(self[rightChildIndex], parent) {
                return false
            }
        }
        return true
    }
}

