//
//  Table1.swift
//  
//
//  Created by André Rohrbeck on 16.01.23.
//

import Foundation

/// The content of *Table 1: Coordinates of the Profile E* between the head of the flange and the outer wheel face.
/// The co-ordinates are independent on the wheel back distance.
///
enum Table1 {

    /// Returns the co-ordinates of the running surface for a profile of type E and the given front-to-front distance.
    ///
    /// - Parameter sr: The front-to-front distance in mm for which to return the running surface co-ordinates.
    ///
    /// - Note: Calling the function with an invalid `sr` will cause an assertion failure.
    /// - SeeAlso: ``DIN5573.validSR``.
    internal static func runningSurface(sr: Int) -> [CGPoint] {
        assert(DIN5573.validSR.contains(sr))
        return zip(xCoords, table1(sr: sr)).map {CGPoint(x: $0.0, y: $0.1)}
    }



    /// Returns the co-ordinates of the outer edge for a profile of type E with a certain width
    /// and the given front-to-front distance.
    ///
    /// - Parameter width: The wheel width in mm.
    /// - Parameter sr: The front-to-front distance in mm for which to return the running surface co-ordinates.
    ///
    /// - Note: Calling the function with an invalid `sr` or `width` will cause an assertion failure.
    /// - SeeAlso: ``DIN5573.validSR``, ``DIN5573.validWidth``.
    internal static func outerEdge(width: Int, sr: Int) -> [CGPoint] {
        assert(DIN5573.validSR.contains(sr))
        assert(DIN5573.validWidth.contains(width))
        switch width {
        case 135:
            let table = table1a(sr: sr)
            return stride(from: 61, through: 65, by: 1).map {
                CGPoint(x: Double($0), y: table[$0-61])
            }
        case 140:
            let table = table1b(sr: sr)
            return stride(from: 61, through: 70, by: 1).map {
                CGPoint(x: Double($0), y: table[$0-61])
            }
        default: fatalError("This should not happen...")
        }
    }


    /// Returns the entries of Table 1 in DIN 5573:1995 for a given front-to-front distance.
    ///
    /// - Parameter sr: The S<sub>R</sub> for which to return the content of Table 1.
    /// - Returns: The running surface co-ordinates for the given `sr`.
    // swiftlint:disable:next cyclomatic_complexity
    private static func table1(sr: Int) -> [Double] {
        assert(DIN5573.validSR.contains(sr))
        switch sr {
        case 1427: return table1_1427
        case 1426: return table1_1426
        case 1425: return table1_1425
        case 1424: return table1_1424
        case 1423: return table1_1423
        case 1422: return table1_1422
        case 1421: return table1_1421
        case 1420: return table1_1420
        case 1419: return table1_1419
        case 1418: return table1_1418
        case 1417: return table1_1417
        case 1416: return table1_1416
        case 1415: return table1_1415
        case 1414: return table1_1414
        case 1413: return table1_1413
        case 1412: return table1_1412
        case 1406: return table1_1406
        default: fatalError("This should not happen...")
        }
    }


    // swiftlint:disable:next cyclomatic_complexity
    private static func table1a(sr: Int) -> [Double] {
        assert(DIN5573.validSR.contains(sr))
        switch sr {
        case 1427: return table1a_1427
        case 1426: return table1a_1426
        case 1425: return table1a_1425
        case 1424: return table1a_1424
        case 1423: return table1a_1423
        case 1422: return table1a_1422
        case 1421: return table1a_1421
        case 1420: return table1a_1420
        case 1419: return table1a_1419
        case 1418: return table1a_1418
        case 1417: return table1a_1417
        case 1416: return table1a_1416
        case 1415: return table1a_1415
        case 1414: return table1a_1414
        case 1413: return table1a_1413
        case 1412: return table1a_1412
        case 1406: return table1a_1406
        default: fatalError("This should not happen...")
        }
    }


    // swiftlint:disable:next cyclomatic_complexity
    private static func table1b(sr: Int) -> [Double] {
        assert(DIN5573.validSR.contains(sr))
        switch sr {
        case 1427: return table1b_1427
        case 1426: return table1b_1426
        case 1425: return table1b_1425
        case 1424: return table1b_1424
        case 1423: return table1b_1423
        case 1422: return table1b_1422
        case 1421: return table1b_1421
        case 1420: return table1b_1420
        case 1419: return table1b_1419
        case 1418: return table1b_1418
        case 1417: return table1b_1417
        case 1416: return table1b_1416
        case 1415: return table1b_1415
        case 1414: return table1b_1414
        case 1413: return table1b_1413
        case 1412: return table1b_1412
        case 1406: return table1b_1406
        default: fatalError("This should not happen...")
        }
    }


    private static var xCoords: [Double] = {
        let part1 = stride(from: -60.0, to: -22.0, by: 0.5).map {$0}
        let part2 = stride(from: -22.0, through: 60.0, by: 1.0).map {$0}
        return part1 + part2
    }()
}
