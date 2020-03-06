//
//  MaxSumOfSubarray.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Given an array of positive numbers and a positive number ‘k’, find the maximum sum of any contiguous subarray of size ‘k’.
 */

// Brute Force
// returns the maximum sum of any subarray of size K
// O(N * K)
func maxSubArray(_ array: [Int], _ k: Int) -> Int {
    var maxSum = 0
    var windowSum = 0
    
    for i in stride(from: 0, through: array.count - k, by: 1) {
        windowSum = 0
        for j in stride(from: i, through: i + k - 1, by: 1) {
            windowSum += array[j]
        }
        if windowSum > maxSum { maxSum = windowSum }
    }
    
    return maxSum
}

// Dynamic Sum Approach
// returns the maximum sum of any subarray of size K
// O(N) time complexity and O(1) space
func maxSubArray_optimized(_ array: [Int], _ k: Int) -> Int {
    var maxSum = 0
    var windowSum = 0
    var windowStart = 0
    
    for windowEnd in stride(from: 0, through: array.count - 1, by: 1) {
        windowSum += array[windowEnd] // add the next element
        // slide the window, we don't need to slide if we haven't yet hit the required window size k
        if (windowEnd >= k - 1) {
            maxSum = max(maxSum, windowSum)
            windowSum -= array[windowStart]
            windowStart += 1
        }
    }
    return maxSum
}
