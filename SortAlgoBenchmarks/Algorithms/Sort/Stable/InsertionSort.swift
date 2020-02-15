//
//  InsertionSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class InsertionSort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        for x in 1..<array.count {
            var y = x
            while y > 0 && array[y] < array[y - 1] {
                array.swapAt(y - 1, y)
                y -= 1
            }
        }
    }
}

