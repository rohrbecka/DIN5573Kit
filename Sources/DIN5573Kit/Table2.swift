//
//  Table2.swift
//  
//
//  Created by André Rohrbeck on 16.01.23.
//

import Foundation


enum Table2 {
    /// The co-ordinates are given for a nominal wheel back-to-back distance of 1360 mm.
    /// For all other wheel back-to-back distances between 1357 and 1363 mm the co-ordinates
    /// can be obtained by simply shifting these co-ordinates and filling up with the constant value
    /// of 28 mm if necessary.
    ///
    /// Co-ordinates are given from -70 mm to -52 mm in 0.5 mm steps.
    private static var table2 = [9.52,
                                 14.02, 15.84, 17.22, 18.35, 19.33, 20.20, 20.98, 21.68, 22.34, 22.94,
                                 23.49, 24.01, 24.49, 24.95, 25.37, 25.75, 26.09, 26.39, 26.67, 26.91,
                                 27.12, 27.31, 27.48, 27.62, 27.74, 27.83, 27.91, 27.96, 27.99, 28.00,
                                 28.00, 28.00, 28.00, 28.00, 28.00, 28.00]



    /// Returns the inner flange profile for profile E according to Table 2 in DIN 5573:1995.
    ///
    /// - Parameter ar: The wheel back-to-back distance in mm.
    internal static func profile(ar: Int) -> [CGPoint] {
        assert(DIN5573.validAR.contains(ar))
        let offset = -(1360.0 - Double(ar))/2.0
        let xCoords = stride(from: -70.0 + offset, through: -52.0, by: 0.5).map {$0}
        return xCoords
            .enumerated()
            .map {
                CGPoint(x: $1,
                        y: table2.at($0))
            }
    }
}



extension Array {
    internal func at(_ index: Index) -> Element {
        if index < count {
            return self[index]
        } else {
            return last!
        }
    }
}
