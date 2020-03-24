//
//  Bag.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/21/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// A bag is a counted set, i.e. can contain duplicated items with their frequencies
class Bag<Element: Hashable> {
    private var storage = Dictionary<Element, Int>()
    
}
