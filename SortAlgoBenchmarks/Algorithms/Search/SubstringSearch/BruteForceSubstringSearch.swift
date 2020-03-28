//
//  SubstringSearch.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// The Pattern: What you're searching
// The Text: the search range

// GOAL: A linear time guarantee for substring search without backup

// requires backing up to the left through the input when a subsequence does not match
// we don't have the luxury of backup in the case of a data stream
