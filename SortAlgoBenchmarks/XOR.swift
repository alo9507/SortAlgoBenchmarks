//
//  XOR.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 Given an array of n−1 integers in the range from 1 to n, find the one number that is missing from the array.
 */

import Foundation

// can cause an overflow where n is large
func findMissingNumber_nonxor(_ array: [Int]) -> Int {
    let n = array.count + 1
    
    var sum = 0
    for i in stride(from: 1, through: n, by: 1) {
        sum += i
    }
    
    array.forEach { (number) in
        sum -= number
    }
    
    return sum
}

func findMissingNumber_xor(_ array: [Int]) -> Int {
    let n = array.count + 1
    
    var x1 = 1
    for i in stride(from: 2, through: n, by: 1) {
        x1 = x1 ^ i
    }
    
    var x2 = array[0]
    for i in stride(from: 1, to: n - 1, by: 1) {
        x2 = x2 ^ array[i]
    }
    
    return x1 ^ x2
}

func findNonDuplicate(_ array: [Int]) -> Int {
    var missingCandidate: Int = array[0]
    
    // since XOR is commutative, it doesn't matter the order we do this in
    for i in stride(from: 1, to: array.count, by: 1) {
        missingCandidate = missingCandidate ^ array[i]
    }
    
    return missingCandidate
}

/*
 In a non-empty array of numbers, every number appears exactly twice except two numbers that appear only once.
 Find the two numbers that appear only once.
 */

func findTwoNumbersThatAppearOnce(_ array: [Int]) -> [Int] {
    return [0]
}
