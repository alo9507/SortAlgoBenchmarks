//
//  Subsets.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/8/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

/*
 Given a set with distinct elements
 Find all of its distinct subsets
 */

import Foundation

// find the Power Set of a given set
// Given a set with distinct elements, find all of its distinct subsets
func allDistinctSubsets(_ set: [Int]) -> [[Int]] {
    var subsets: [[Int]] = Array(Array())
    subsets.append([])
    
    for (_, element) in set.enumerated() {
        for subset in subsets {
            var newSubset = subset
            newSubset.append(element)
            subsets.append(newSubset)
        }
    }
    
    return subsets
}

