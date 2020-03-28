//
//  BoyerMoore.swift
//  SortAlgoBenchmarks
//
//  Created by Andrew O'Brien on 3/23/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

// ~ N / M time! sublinear as the pattern gets longer. the longer the pattern compared to the text the better!

// Scans right to left so we can skip a lot of other text

// Fast because you can progress forward by N characters at a time

// Question: how much to skip?

// How long does pre-computation take
