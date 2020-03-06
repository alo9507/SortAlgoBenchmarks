//
//  SmallestSubarrayWithSum.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// INPUTS: Given an array of positive numbers and a positive number ‘S’
// Return the length of the smallest contiguous subarray whose sum is greater than or equal to ‘S’.
// Return 0, if no such subarray exists.

/*
 Initial & Terminal Iterators
 Start with window size of one
 Slide across array to see if single element exists that meets condition sum(subarray) >= S
 
 Updatables
 Length of current smallest subarray meeting the condition sum(subarray) >= S
 windowSum
 maxSum
 */

// O(N)
// outter for loop runs for all elements
// the inner while loop processes each element only once
// O(N + N) which is asymptotically equivalent to O(N)
func smallestSubarrayWithGivenSum(_ targetSum: Int, _ array: [Int]) -> Int {
    var windowSum = 0
    
    // use Int.max as a starting value for a running minimum
    var minLength = Int.max
    var windowStart = 0
    
    for windowEnd in stride(from: 0, through: array.count - 1, by: 1) {
        windowSum += array[windowEnd]; // add the next element
        // shrink the window as small as possible until the 'window_sum' is smaller than 's'
        while (windowSum >= targetSum) {
            minLength = min(minLength, windowEnd - windowStart + 1);
            windowSum -= array[windowStart];
            windowStart += 1;
        }
    }
    
    if minLength == Int.max {
        return 0
    }
    return minLength;
}
