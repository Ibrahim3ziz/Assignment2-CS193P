//
//  IntExtension.swift
//  Assignment-2
//
//  Created by Ibrahim Abdul Aziz on 2/20/20.
//

import Foundation

extension Int {
    var arc4random: Int {
        if self > 0 {
            return Int(arc4random_uniform(UInt32(abs(self))))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
    }
}
