//
//  UnionFind.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//
/*
 Union-Find Data Structure
 
 Performance:
 adding new set is almost O(1)
 finding set of element is almost O(1)
 union sets is almost O(1)
 */

public struct UnionFind<T: Hashable> {
    // We save the index of new elements in the index dictionary.
    // This lets us look up the index element quickly
    private var index = [T: Int]()
    
    // parent[i] returns the index of node i's parent
    private var parent = [Int]()
    
    private var size = [Int]()
    
    public init() {}
    
    mutating public func allSets() -> [Int: [T]] {
        var result: [Int: [T]] = [:]
        for element in index.keys {
            guard let setIndex = setOf(element) else { fatalError("Blast!") }
            result[setIndex, default: []].append(element)
        }
        return result
    }
    
    public mutating func addSetWith(_ element: T) {
        index[element] = parent.count
        parent.append(parent.count)
        
        // size[i] is the count of nodes in the tree whose root is at index i
        // it starts at one since this set only has a root
        // size is used in the Union operation
        size.append(1)
    }
    
    // recrusive method to find the index of the root element for the index of this element
    // Each set is represented by a tree and the index of the root node serves as the number that identifies the set
    // This find the root node of the tree that the element we're searching for belongs to
    private mutating func setByIndex(_ index: Int) -> Int {
        // check if the given index represents a root node (i.e. a node whose parent points back to the node itself)
        if parent[index] == index {
            return index
        } else {
            // otherwise we recursively call this method on the parent of the current node
            // we overwrite the parent of the current node with the index of the root node
            // the next time we call this method it will execute more quickly
            // wihtout the path compression optimization the complexity is O(n), with it its alpha(1)
            parent[index] = setByIndex(parent[index])
            return parent[index]
        }
    }
    
    // aka find
    // uses index dictionary to find the element's index,
    // then it uses a helper method, setByIndex, to lookup the set that this element belongs to
    public mutating func setOf(_ element: T) -> Int? {
        if let indexOfElement = index[element] {
            return setByIndex(indexOfElement)
        } else {
            return nil
        }
    }
    
    // since this calls setOf it also optimizes the tree
    public mutating func unionSetsContaining(_ firstElement: T, and secondElement: T) {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            if firstSet != secondSet {
                // this performs the size operation (weighting)
                // we want to keep the tree as shallow as possible
                // so we always attach the smaller tree to the root of the larger tree
                if size[firstSet] < size[secondSet] {
                    parent[firstSet] = secondSet
                    size[secondSet] += size[firstSet]
                } else {
                    parent[secondSet] = firstSet
                    size[firstSet] += size[secondSet]
                }
            }
        }
    }
    
    // since this calls setOf it also optimizes the tree
    public mutating func inSameSet(_ firstElement: T, and secondElement: T) -> Bool {
        if let firstSet = setOf(firstElement), let secondSet = setOf(secondElement) {
            return firstSet == secondSet
        } else {
            return false
        }
    }
}
