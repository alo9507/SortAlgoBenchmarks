//
//  LinearSearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

extension RandomAccessCollection where Element: Equatable {
    /// Returns the index of the requested element, or nil if not present
    /// - Parameter element: An Equatable element
    func linearSearch(for value: Element) -> Int? {
        for (index, candidate) in self.enumerated() {
            if candidate == value {
                return index
            }
        }
        return nil
    }
}
