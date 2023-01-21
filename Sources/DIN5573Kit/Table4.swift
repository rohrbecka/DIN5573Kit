//
//  Table4.swift
//  
//
//  Created by André Rohrbeck on 21.01.23.
//

import Foundation


enum Table4 {

    /// Returns the inner flange profile for profile EH according to Table 4 in DIN 5573:1995.
    ///
    /// - Parameter ar: The wheel back-to-back distance in mm.
    internal static func profile(ar: Int) -> [CGPoint] {
        Table2.profile(ar: ar)
            .map {CGPoint(x: $0.x, y: $0.y+4)}
    }

}
