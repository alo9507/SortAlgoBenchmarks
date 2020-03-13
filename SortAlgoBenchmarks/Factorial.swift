//
//  Factorial.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/12/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func factorial(_ num: Int) -> Int {
    if num == 1 { return num }
    
    return num * factorial(num - 1)
}
