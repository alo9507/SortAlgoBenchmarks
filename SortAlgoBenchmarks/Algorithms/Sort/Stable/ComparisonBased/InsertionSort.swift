//
//  InsertionSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Everything to left of i is in ascending order. Everything to the right we haven't seen yet
// Takes advantage of natural order of input.
// Invariant: All items to the left of i is in sorted ascending order. The inner loop swap maintians this invariant. Typically the work of the inner loop is to maintian the sort invariant.

// Uses about N^2 / 4 compares and swaps

// Performs poorly on descending arrays because it will have to perform i exchanges
// Performs linearly on partially sorted arrays

// Invariant: all items to the left of the i pointer are in ascending order
class InsertionSort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        for i in 1..<array.count {
            for j in stride(from: i, to: 0, by: -1) {
                // check for an inversion
                if array[j - 1] > array[j] {
                    array.swapAt(j - 1, j)
                }
            }
        }
    }
    
    static func boundedSort<Element: Comparable>(_ array: inout [Element], start: Int, gap: Int) {
        for i in stride(from: start, to: array.count, by: gap) {
            for j in stride(from: i, to: array.count, by: gap) {
                if array[i] > array[j] {
                    array.swapAt(j-1, j)
                }
            }
        }
    }
    
    static func sort_semantic<Element: Comparable>(_ array: inout [Element]) {
        for i in 1..<array.count {
            for j in stride(from: i, to: 0, by: -1) {
                // check for an inversion
                if inversionExists(array[j-1], array[j]) {
                    repairInvariant(&array, j - 1, j)
                }
            }
        }
    }
    
    private static func inversionExists<Element: Comparable>(_ leftElement: Element, _ rightElement: Element) -> Bool {
        return leftElement > rightElement
    }
    
    private static func repairInvariant<Element: Comparable>(_ array: inout [Element], _ index1: Int, _ index2: Int) {
        array.swapAt(index1, index2)
    }
}

