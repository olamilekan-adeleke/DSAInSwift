//
//  bs_list.swift
//  DSA
//
//  Created by Enigma Kod on 27/06/2023.
//

import Foundation

func bsList(haystack: [Int], needle: Int) -> Bool {
    var low = 0
    var high = haystack.count - 1

    while low < high {
        let mid = Int(Double(low) + Double(high + low) / 2)

        if needle == haystack[mid] {
            return true
        } else if needle > haystack[mid] {
            low = mid + 1
        } else {
            high = mid
        }
    }

    return false
}
