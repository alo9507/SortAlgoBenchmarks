//
//  RunLengthEncoding.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 4/10/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation


/// Companion Algo, Compression Ratio
enum RunLengthEncoding {
    static func encode(input: String) -> [(Int, Character)] {
        var bitstream = Array(input)
        return bitstream.reduce([(Int, Character)]()) {
            if $0.last?.1 == $1 { var r = $0; r[r.count - 1].0 += 1; return r; }
            return $0 + [(1, $1)]
        }
    }
}
