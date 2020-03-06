//
//  LongestSubstringWithDistinctChars.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/6/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// Given a string,
// Find the length of the longest substring in it with NO MORE than K distinct characters

/*
 Initial and Terminal Iterator Values:
    Slide window forward until number of distinct chars >= k
 
 Updatables:
    Chars in substring
    Current longest substring length
 */

func longestSubstringWithDistinctChars(_ inputString: String, _ k: Int) -> Int {
    var str = Array(inputString)
    var windowStart = 0
    var maxLength = 0
    var charFrequency: [String.Element: Int] = [:]
    
    for windowEnd in stride(from: 0, through: str.count - 1, by: 1) {
        let rightChar = str[windowEnd]
        charFrequency[rightChar, default: 0] += 1
        
        while (charFrequency.keys.count > k) {
            let leftChar = str[windowStart]
        }
        
    }
    
    return 4
}
