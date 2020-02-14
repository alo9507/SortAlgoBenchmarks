//
//  SelectionSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class SelectionSort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        guard array.count > 1 else { return }
        
        for x in 0 ..< array.count - 1 {
            
            var lowest = x
            for y in x + 1 ..< array.count {
                if array[y] < array[lowest] {
                    lowest = y
                }
            }
            
            if x != lowest {
                array.swapAt(x, lowest)
            }
        }
    }
}

