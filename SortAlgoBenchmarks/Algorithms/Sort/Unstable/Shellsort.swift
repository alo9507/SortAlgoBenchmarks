//
//  ShellSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/22/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// H-sorted array

// Worst case compares is O(N ^ 3/2)
// No one has model to describe this
class Shellsort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        var sublistCount = array.count / 2
        while sublistCount > 0 {
            for pos in 0..<sublistCount {
                InsertionSort.boundedSort(&array, start: pos, gap: sublistCount)
            }
            sublistCount = sublistCount / 2
        }
    }
}
