//
//  IteratedLogFunction.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/20/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

func log(_ x: Double, _ base: Double) -> Double {
    return log(x) / log(base)
}

func recursiveLogStart(_ n: Double, _ b: Double) -> Double {
    if n > 1.0 {
        return 1.0 + recursiveLogStart(log(n,b), b)
    } else {
        return 0
    }
}
