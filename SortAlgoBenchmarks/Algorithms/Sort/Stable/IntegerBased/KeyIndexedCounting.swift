//
//  KeyIndexedCounting.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/27/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 It works by counting the number of objects having distinct key values
 Then doing some arithmetic to calculate the position of each object in the output sequence
 */

/// Counting sort is a sorting technique based on keys between a specific range
/// - Parameter array: an unsroted array
func keyIndexedCounting(_ array: inout [Int], in range: ClosedRange<Int>) -> [Int] {
    var range = range.lowerBound.distance(to: range.upperBound)
    var counts = [Int](repeating: 0, count: range)
    
    // Step 1: Construct count array
    for i in stride(from: 0, to: range, by: 1) {
        counts[array[i]] += 1
    }
    
    // Step 2: Modify count array by adding previous counts
    // This tells us how many inputs we have
    for i in stride(from: 0, to: counts.count - 1, by: 1) {
        counts[i + 1] += counts[i]
    }
    
    var sorted = [Int](repeating: 0, count: counts[counts.count - 1])
    
//    for i in stride(from: 0, to: sorted.count, by: 1) {
//        sorted[i] = 
//    }
    
    return []
}
