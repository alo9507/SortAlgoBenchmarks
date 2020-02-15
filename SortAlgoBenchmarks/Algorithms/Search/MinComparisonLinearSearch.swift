//
//  MinComparisonLinearSearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

/// A linear search which requires only N + 2 comparisons, rather than the typical 2N + 1 worst case comparisons of linear search
extension RandomAccessCollection where Element: Equatable {
    /// Returns the index of the requested element, or nil if not present
    /// - Parameter element: An Equatable element
    func minComparisonLinearSearch(for value: Element) -> Int? {
        for (index, candidate) in self.enumerated() {
            if candidate == value {
                return index
            }
        }
        return nil
    }
}

//search(arr, n, x)
//if arr[n-1] == x  // 1 comparison
//   return "true"
//backup = arr[n-1]
//arr[n-1] = x
//
//for i=0, i++ // no termination condition
//    if arr[i] == x // execute at most n times
//                   // that is at-most n comparisons
//        arr[n-1] = backup
//        return (i < n-1) // 1 comparison
