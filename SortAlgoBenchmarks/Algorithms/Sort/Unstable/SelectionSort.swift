//
//  SelectionSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// N^2 / 2
// Invariant: all items to the left of the i pointer are in ascending order
class SelectionSort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        guard array.count > 1 else { return }
        
        for i in stride(from: 0, to: array.count, by: 1) {
            var lowest = i
            for j in stride(from: i+1, to: array.count, by: 1) {
                if array[j] < array[lowest] {
                    lowest = j
                }
            }
            
            if lowest != i {
                array.swapAt(i, lowest)
            }
        }
    }
}
