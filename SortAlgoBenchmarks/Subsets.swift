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

// Given a set of numbers that might contain duplicates, find all of its distinct subsets
func allDistinctSubsetsWithDuplicates(_ set: [Int]) -> [[Int]] {
    var subsets: [[Int]] = Array(Array())
    subsets.append([])
    // Sort all numbers of the given set. This will ensure that duplicates are collocated
    var sortedSet = set.sorted()
    
    
    // Follow the same Breadth-First Search approach, but whenever we are about to process a duplicate (i.e. when the current and previous are identical), instead of adding the current number (which is a duplicate) to all existing subsets, we only add it to the subsets which were created in the previous step
    
    var previous: Int = Int.min
    var previouslyAddedSets: [Int] = []
    for number in sortedSet {
        for subset in subsets {
            if number == previous {
                
            }
            var newSubset = subset
            newSubset.append(number)
            subsets.append(newSubset)
        }
        previous = number
    }
    return subsets
}
