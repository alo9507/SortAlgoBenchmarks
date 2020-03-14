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
    let range = range ?? 0..<array.count
    let rangeSize = range.lowerBound.distance(to: range.upperBound)
    let middle = rangeSize / 2
    
    guard range.lowerBound < range.upperBound else {
        return -1
    }
    
    if array[middle] == value {
        return middle
    } else if array[middle] > value {
        return orderAgnosticBinarySearch(for: value, array: array, range: range.lowerBound..<middle)
    } else {
        return orderAgnosticBinarySearch(for: value, array: array, range: middle..<range.upperBound)
    }
}


