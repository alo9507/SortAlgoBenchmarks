//
//  3Sum.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// O(N^3)
func threeSum_cubic(_ numbers: [Int]) -> Int {
    var count = 0
    
    for i in stride(from: 0, to: numbers.count - 2, by: 1) {
        for j in stride(from: i + 1, to: numbers.count - 1, by: 1) {
            for k in stride(from: j + 1, to: numbers.count, by: 1) {
                if (numbers[i] + numbers[j] + numbers[k] == 0) {
                    count += 1
                }
            }
        }
    }
    
    return count
}

// O(N^2)
func threeSum_exponential(_ numbers: [Int]) -> Int {
    var sorted = numbers.sorted()
    
    return 0
}
