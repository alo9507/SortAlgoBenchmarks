//
//  BinarySearch.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// BEST CASE TIME COMPLEXITY:       O(log n)
// WORST CASE TIME COMPLEXITY:      O(log n)
// AVERAGE CASE TIME COMPLEXITY:    O(log n)

/// Two requirements for binary search to work:
/// 1) RandomAccessCollection: index manipulation can happen in constant time O(1)
/// 2) Sorted
/// Each iteration of a binary search effectively removes half of the comparisons you might make
extension RandomAccessCollection where Element: Comparable {
    func recursiveBinarySearch(for value: Element, in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: size / 2)
        
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return recursiveBinarySearch(for: value, in: range.lowerBound..<middle)
        } else {
            return recursiveBinarySearch(for: value, in: index(after: middle)..<range.upperBound)
        }
    }
}

func iterativeBinarySearch(searchValue: Int, array: [Int]) -> Bool {
    var leftIndex = 0
    var rightIndex = array.count - 1
    
    // testing for index cross instead of array length reached
    while leftIndex <= rightIndex {
        let middleIndex = (leftIndex + rightIndex) / 2
        let middleValue = array[middleIndex]
        
        if middleValue == searchValue {
            return true
        }
        
        if searchValue < middleValue {
            rightIndex = middleIndex - 1
        }
        
        if searchValue > middleValue {
            leftIndex = middleIndex - 1
        }
    }
    
    return false
}
