//
//  MergeIntervals.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/7/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/*
 Given a list of intervals
 Merge all the overlapping intervals
 To produce a list that has only mutually exlclusive intervals
 */

/*
 Three possibilities of interval interaction:
 1. Nested
 2. Disjoint
 3. Interleaved
 */

func mergeOverlappingIntervals(_ intervals: [CountableClosedRange<Int>]) -> [CountableClosedRange<Int>] {
    var mergedIntervals:[CountableClosedRange<Int>] = []
    
    // sort intervals on start time
    let sortedIntervals = intervals.sorted { (a, b) -> Bool in
        return a.lowerBound <= b.lowerBound
    }
    
    var start = sortedIntervals[0].lowerBound
    var end = sortedIntervals[0].upperBound
    
    for interval in sortedIntervals {
        if (interval.lowerBound <= end) {
            end = max(interval.upperBound, end)
        } else { // non-overlapping interval, add the previous interval and reset
            mergedIntervals.append(start...end)
            start = interval.lowerBound
            end = interval.upperBound
        }
    }
    
    mergedIntervals.append(start...end)
    return mergedIntervals
}

func overlaps(_ a: CountableClosedRange<Int>, b: CountableClosedRange<Int>) -> Bool {
    // a is contained in b
    let aContainsB = a.lowerBound >= b.lowerBound && a.upperBound <= b.upperBound
    
    // b is contained in a
    let bContainsA = b.lowerBound >= a.lowerBound && b.upperBound <= a.upperBound
    
    // a leftwise overlaps b
    let aLeftwiseOverlapsB = a.lowerBound <= b.lowerBound && b.contains(a.upperBound)
    
    // a rightwise overlaps b
    let aRightwiseOverlapsB = b.lowerBound <= a.lowerBound && a.contains(b.upperBound)
    
    return aContainsB || bContainsA || aLeftwiseOverlapsB || aRightwiseOverlapsB
}
