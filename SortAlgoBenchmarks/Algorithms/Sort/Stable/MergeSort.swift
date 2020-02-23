//
//  MergeSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// BEST CASE:       O(n log n)
// WORST CASE:      O(n log n)
// AVERAGE CASE:    O(n log n)

// SPACE COMPLEXITY:    O(n log n) (allocates new memory in `sort` to split data and again in `merge` to combine in result array)
class Merge<Element: Comparable> {
    /// Recursive function to sort
    /// - Parameter elements: an array of Comparable elements
    static func sort(_ elements: [Element]) -> [Element] {
        // Base case/Exit condition when array has just one element
        guard elements.count >= 2 else {
            return elements
        }
        
        // Find the middle of the array to split it in half
        let middle = elements.count / 2
        
        // Each time you split the array in half, split again until left and right have just one element
        
        // The entire left half is split into single elements and sorted FIRST
        let left = sort(Array(elements[0..<middle]))
        
        // Then, we move on to split the right half into single-element arrays
        let right = sort(Array(elements[middle...]))
        
        // The first time this is called, it's with two single-element arrays
        return merge(left, right)
    }
    
    /// Combines two sorted arrays into a single sorted array
    /// - Parameters:
    ///   - left: a SORTED array
    ///   - right: a SORTED array
    static func merge<Element: Comparable>(_ left: [Element], _ right: [Element]) -> [Element] {
        var leftIndex: Int = 0
        var rightIndex: Int = 0
        var result: [Element] = []
        
        // Only loop while the left and right array both have elements
        // Guarantees that the entirety of EITHER the left OR the right array has been added to the result array
        while leftIndex < left.count && rightIndex < right.count {
            let leftElement = left[leftIndex]
            let rightElement = right[rightIndex]
            
            // Append the smaller of two elements to the result array
            if leftElement < rightElement {
                result.append(leftElement)
                leftIndex += 1
            } else if leftElement > rightElement {
                result.append(rightElement)
                rightIndex += 1
            } else {
                result.append(leftElement)
                result.append(rightElement)
                rightIndex += 1
                leftIndex += 1
            }
        }
        
        let elementsRemainInLeftArray = leftIndex < left.count
        if elementsRemainInLeftArray {
            result.append(contentsOf: left[leftIndex...])
        }
        
        let elementsRemainInRightArray = rightIndex < right.count
        if elementsRemainInRightArray {
            result.append(contentsOf: right[rightIndex...])
        }
        
        return result
    }
}
