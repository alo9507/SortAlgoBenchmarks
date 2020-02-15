//
//  Utils.swift
//  SortAlgoBenchmarksTests
//
//  Created by Andrew O'Brien on 2/15/20.
//  Copyright © 2020 Andrew O'Brien. All rights reserved.
//

import Foundation

class Utils {
    static func timeElapsed(_ title:String, operation:()->()) {
        let methodStart = Date()
        operation()
        let methodFinish = Date()
        let executionTime = methodFinish.timeIntervalSince(methodStart)
        let executionTimeInMillis = (executionTime * 1000)
        let roundedMilliseconds = String(format: "%.4f", executionTimeInMillis)
        print("⌛️ \(title): \(roundedMilliseconds)")
    }
}
