//
//  LinearSearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// BEST CASE (TIME):    O(1)
// WORST CASE (TIME):   O(n)
// AVERAGE CASE (TIME): O(n)

// WORST CASE (COMPARISON): 2N + 1 Comparisons
extension RandomAccessCollection where Element: Equatable {
    /// Returns the index of the requested element, or nil if not present
    /// - Parameter element: An Equatable element
    func linearSearch(for value: Element) -> Int? {
        for (index, candidate) in self.enumerated() { // WORST CASE requires N + 1 comparisons
            if candidate == value { // WORST CASE requires N comparisons
                return index
            }
        }
        return nil
    }
}
