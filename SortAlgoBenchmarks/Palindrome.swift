//
//  Palindrome.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func isPalindrom(_ s: String) -> Bool {
    guard s.count > 0 else { return true }
    
    let string = Array(s)
    
    var leftPointer = 0
    var rightPointer = string.count - 1
    
    while leftPointer < rightPointer {
        if string[leftPointer] != string[rightPointer] { return false }
        leftPointer += 1
        rightPointer -= 1
    }
    
    return true
}
