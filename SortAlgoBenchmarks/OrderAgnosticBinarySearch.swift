//
//  OrderAgnosticBinarySearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/14/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 Given a sorted array of numbers, find if a given number ‘key’ is present in the array.
 Though we know that the array is sorted, we don’t know if it’s sorted in ascending or descending order.
 You should assume that the array can have duplicates.
 */

import Foundation

func orderAgnosticBinarySearch(for value: Int, array: [Int], range: Range<Int>? = nil) -> Int {
    guard !array.isEmpty else { return -1 }
    let isAscending = array[0] < array[array.count - 1]
    
    let range = range ?? 0..<array.count
    
    if range.lowerBound >= range.upperBound {
        return -1
    }
    
    // the middle of this range can be found at the lower bound offset by half the distance between the upper and lower bound
    let middle = range.lowerBound + (range.upperBound - range.lowerBound) / 2
    
    if array[middle] == value {
        return middle
    }
    
    if isAscending {
        if array[middle] > value {
            return orderAgnosticBinarySearch(for: value, array: array, range: range.lowerBound..<middle)
        } else {
            return orderAgnosticBinarySearch(for: value, array: array, range: middle + 1..<range.upperBound)
        }
    } else {
        if array[middle] > value {
            return orderAgnosticBinarySearch(for: value, array: array, range: middle + 1..<range.upperBound)
        } else {
            return orderAgnosticBinarySearch(for: value, array: array, range: range.lowerBound..<middle)
        }
    }
}


