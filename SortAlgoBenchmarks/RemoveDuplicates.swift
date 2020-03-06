//
//  RemoveDuplicates.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 Given an array of sorted numbers
 Remove all duplicates from it in O(1) space
 After removing duplicates in place return the new length of the array
 */

import Foundation

func removeDuplicates(_ array: inout [Int]) -> Int {
    var left = 0
    var right = 1
    
    while (right < array.count) {
        if array[left] == array[right] {
            array.remove(at: left)
            continue
        }
        left += 1
        right += 1
    }
    
    return array.count
}

/*
 Given an unsorted array of numbers and a target key
 Remove all instances of key in-place and return the new length of the array
 */
func removeAllInstancesOfKey(_ array: inout [Int], _ key: Int) -> Int {
    
    return array.count
}
