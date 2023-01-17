//
//  DIN5573.swift
//
//
//  Created by André Rohrbeck on 16.01.23.
//
import Foundation

/// The profiles as defined in DIN 5573:1995.
public enum DIN5573 {
    /// Creates a wheel profile as defined in DIN 5573.
    ///
    /// - Parameters:
    ///   - type: The type of wheel profile to be created.
    ///   - sr: The flange-to-flange distance of the wheelset; allowed values from
    ///         1427 to 1412 in mm steps and 1406.
    ///   - width: The width of the wheelset (either 135 or 140)
    ///   - ar: The wheel back-to-back distance in mm. Allowed values from 1357 to 1363 mm in mm steps.
    public static func profile(_ type: WheelProfileType,
                               sr: Int,
                               width: Int,
                               ar: Int) throws -> WheelProfile {
        guard validSR.contains(sr) else {
            throw DIN5573Error.invalidSR
        }
        guard validWidth.contains(width) else {
            throw DIN5573Error.invalidWidth
        }
        guard validAR.contains(ar) else {
            throw DIN5573Error.invalidAR
        }

        return generateProfile(type, sr: sr, width: width, ar: ar)
    }



    public static let validSR = [1427, 1426, 1425, 1424, 1423, 1422, 1421, 1420, 1419, 1418,
                                 1417, 1416, 1415, 1414, 1413, 1412, 1406]


    public static let validWidth = [135, 140]


    public static let validAR = [1357, 1358, 1359, 1360, 1361, 1362, 1363]


    private static func generateProfile(_ type: WheelProfileType, sr: Int, width: Int, ar: Int) -> WheelProfile {
        assert(validSR.contains(sr))
        assert(validWidth.contains(width))
        assert(validAR.contains(ar))

        var profilePoints: [CGPoint]
        switch type {
        case .e: profilePoints = generateProfilePoints(inner: Table2.profile(ar: ar),
                                                       main: Table1.profile(sr: sr),
                                                       outer: Table1.profile(width: width, sr: sr))
        case .eh: profilePoints = []
//            profilePoints.generateProfilePoints(inner: Table4.profile(ar: ar),
//                                               main: Table3.profile(sr: sr),
//                                               outer: Table3.profile(width: width))
        }
        return WheelProfile(type: type, sr: sr, ar: ar, width: width, profile: profilePoints)
    }

    private static func generateProfilePoints(inner: [CGPoint], main: [CGPoint], outer: [CGPoint]) -> [CGPoint] {
        return inner + main + outer
    }
}
