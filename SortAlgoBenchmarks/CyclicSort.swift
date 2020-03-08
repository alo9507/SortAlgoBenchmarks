//
//  CyclicSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/7/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 We are given an array containing ‘n’ objects. Each object, when created, was assigned a unique number from 1 to ‘n’ based on their creation sequence.
 This means that the object with sequence number ‘3’ was created just before the object with sequence number ‘4’.

 Write a function to sort the objects in-place on their creation sequence number in O(n)O(n) and without any extra space.
 For simplicity, let’s assume we are passed an integer array containing only the sequence numbers, though each number is actually an object.
 */

import Foundation

func cyclicSort(_ array: inout [Int]) {
    for i in stride(from: 0, through: array.count - 1, by: 1) {
        let sequenceNumber = array[i]
        let tmp = array[sequenceNumber-1]
        array[sequenceNumber-1] = array[i]
        array[i] = tmp
    }
}

/*
 We are given an array containing ‘n’ distinct numbers taken from the range 0 to ‘n’.
 Since the array has only ‘n’ numbers out of the total ‘n+1’ numbers, find the missing number.
 */

func findMissingNumber(_ inputArray: [Int]) -> Int {
    var array = inputArray
    for i in stride(from: 0, through: array.count - 1, by: 1) {
        if array[i] < array.count {
            let sequenceNumber = array[i]
            let tmp = array[sequenceNumber]
            array[sequenceNumber] = array[i]
            array[i] = tmp
        }
    }
    
    for i in stride(from: 0, through: array.count - 1, by: 1) {
        if array[i] != i {
            return i
        }
    }
    
    return 0
}
