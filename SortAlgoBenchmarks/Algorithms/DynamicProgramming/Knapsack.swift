//
//  Knapsack.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/30/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// O(2^n)
func knapsack_bruteForce(_ profits: [Int], _ weights: [Int], _ capacity: Int) -> Int {
    
    func recursiveKnapsack(_ weights: [Int],
                           _ profits: [Int],
                           _ capacity: Int,
                           _ currentIndex: Int) -> Int {
        if currentIndex >= profits.count { return 0 }
        
        var profit1 = 0
        if (weights[currentIndex] <= capacity) {
            profit1 = profits[currentIndex] + recursiveKnapsack(weights,
                                                                profits,
                                                                capacity - weights[currentIndex],
                                                                currentIndex + 1)
        }
        
        let profit2 = recursiveKnapsack(weights, profits, capacity, currentIndex + 1)
        
        return max(profit1, profit2)
    }
    
    return recursiveKnapsack(profits, weights, capacity, 0)
}

func knapsack_memoized(_ profits: [Int], _ weights: [Int], _ capacity: Int) -> Int {
    let dp = [[Any]]()
    
    func recursiveKnapsack(_ weights: [Int],
                           _ profits: [Int],
                           _ capacity: Int,
                           _ currentIndex: Int) -> Int {
        if currentIndex >= profits.count { return 0 }
        
        var profit1 = 0
        if (weights[currentIndex] <= capacity) {
            profit1 = profits[currentIndex] + recursiveKnapsack(weights,
                                                                profits,
                                                                capacity - weights[currentIndex],
                                                                currentIndex + 1)
        }
        
        let profit2 = recursiveKnapsack(weights, profits, capacity, currentIndex + 1)
        
        return max(profit1, profit2)
    }
    
    return recursiveKnapsack(profits, weights, capacity, 0)
}
