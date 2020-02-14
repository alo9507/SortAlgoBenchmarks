//
//  BubbleSort.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/13/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class BubbleSort {
    static func sort<Element: Comparable>(_ array: inout [Element]) {
        for i in 0..<array.count {
            for j in 1..<array.count - i {
                if array[j] < array[j-1] {
                    let tmp = array[j-1]
                    array[j-1] = array[j]
                    array[j] = tmp
                }
            }
        }
    }
}
