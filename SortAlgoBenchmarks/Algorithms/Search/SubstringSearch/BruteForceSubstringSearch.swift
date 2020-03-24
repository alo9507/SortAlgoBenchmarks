//
//  SubstringSearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// GOAL: A linear time guarantee for substring search without backup (space complexity of 0)

// requires backing up to the left through the input when a subsequence does not match
// we don't have the luxury of backup in the case of a data stream
