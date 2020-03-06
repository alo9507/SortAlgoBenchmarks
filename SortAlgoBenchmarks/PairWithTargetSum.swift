//
//  PairWithTargetSum.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Given an array of sorted numbers and a target sum
// Find a pair in the array whose sum is equal to the given target sum

/*
 Initial and Terminal Iterators
 
 Updatables
 
 */

// O(N)
func pairWithTargetSum(_ array: [Int], _ targetSum: Int) -> [Int] {
    var left = 0
    var right = array.count - 1
    
    while (left < right) {
        let sum = array[left] + array[right]
        
        if sum == targetSum {
            return [left, right]
        }
        
        if sum > targetSum {
            right -= 1
        } else if sum < targetSum {
            left += 1
        }
    }
    
    return [-1, -1]
}

func pairWithTargetSum_hash(_ array: [Int], _ targetSum: Int) -> [Int] {
    var numbers: [Int: Int] = [:]
    for i in stride(from: 0, through: array.count - 1, by: 1) {
        let num = array[i]
        if (numbers.keys.contains(targetSum - num)) {
            return [numbers[targetSum - num]!, i]
        }
        numbers[array[i]] = i
    }
    return [-1, -1]
}
