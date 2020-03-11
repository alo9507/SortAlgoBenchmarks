//
//  IOSetup.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

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
