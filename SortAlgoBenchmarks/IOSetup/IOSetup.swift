//
//  IOSetup.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// ------------------------
// IO Setup
// ------------------------

func readInt() -> Int {
    return Int(readLine()!)!
}

func readIntArray() -> [Int] {
    let stringArray = readLine()!.split(separator: " ").map(String.init)
    
    var intArray: [Int] = []
    
    for item in stringArray {
        intArray.append(Int(item)!)
    }
    
    return intArray
}

func red() {
    let arr = [1,2,3]
    
    var hourGlassSum = 0
    arr.forEach { (num) in
        hourGlassSum += num
    }
    
    var least = Int.min
}

// ------------------------
// Starting the Problem
// ------------------------
