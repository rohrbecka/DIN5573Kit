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
    ///   - sr: The front-to-front distance of the wheelset; allowed values are given in ``validSR``.
    ///   - width: The width of the wheelse in mm. Allowed values are given by ``validWidth``.
    ///   - ar: The wheel back-to-back distance in mm. Allowed values are given by ``validAR``.
    ///
    /// - Returns: The wheel profile holding the parameters as well as the co-ordinates of the profile.
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


    /// The valid measures of the front-to-front dimension S<sub>R</sub> on the wheelset in mm.
    public static let validSR = [1427, 1426, 1425, 1424, 1423, 1422, 1421, 1420, 1419, 1418,
                                 1417, 1416, 1415, 1414, 1413, 1412, 1406]


    /// The valid wheel widths in mm.
    public static let validWidth = [135, 140]


    /// The valid measures for the wheel back-to-back distance A<sub>R</sub>.
    public static let validAR = [1357, 1358, 1359, 1360, 1361, 1362, 1363]


    /// Creates a ``WheelProfile`` based on the given parameters.
    ///
    /// - Parameters:
    ///   - type: The type of wheel profile to be created.
    ///   - sr: The front-to-front distance of the wheelset; allowed values are given in ``validSR``.
    ///   - width: The width of the wheelse in mm. Allowed values are given by ``validWidth``.
    ///   - ar: The wheel back-to-back distance in mm. Allowed values are given by ``validAR``.
    private static func generateProfile(_ type: WheelProfileType, sr: Int, width: Int, ar: Int) -> WheelProfile {
        assert(validSR.contains(sr))
        assert(validWidth.contains(width))
        assert(validAR.contains(ar))

        var profilePoints: [CGPoint]
        switch type {
        case .e: profilePoints = generateProfilePoints(inner: Table2.profile(ar: ar),
                                                       main: Table1.runningSurface(sr: sr),
                                                       outer: Table1.outerEdge(width: width, sr: sr))
        case .eh: profilePoints = []
            profilePoints = generateProfilePoints(inner: Table4.profile(ar: ar),
                                                  main: Table3.runningSurface(sr: sr),
                                                  outer: Table3.outerEdge(width: width, sr: sr))
        }
        return WheelProfile(type: type, sr: sr, ar: ar, width: width, profile: profilePoints)
    }


    /// Generates the complete profile based on the `inner`,  `main` and `outer` part.
    /// The inner part representing the inner part of the flange and the main part representing the outer part of
    /// the flange and the main running surface are superposed. They are intersecting in one area, where the
    /// lowest point should define the point of intersection.
    ///
    /// This function intersects these parts and returns a cleaned-up complete profile.
    ///
    /// - Parameters:
    ///   - inner: The co-ordinates of the inner side of the flange.
    ///   - main: The co-ordinates of the outer side of the flange and the running surface.
    ///   - outer: The co-ordinates of the outer edge of the profile, which may be directly
    ///             connected to the `main` part.
    private static func generateProfilePoints(inner: [CGPoint], main: [CGPoint], outer: [CGPoint]) -> [CGPoint] {
        return concatenate(inner, main) + outer
    }



    private static func concatenate(_ lhs: [CGPoint], _ rhs: [CGPoint]) -> [CGPoint] {
        guard
            let lhsFirst = lhs.firstIndex(where: {$0.x == rhs[0].x}),
            let lhsLastPoint = lhs.last,
            let rhsLast = rhs.firstIndex(where: {$0.x == lhsLastPoint.x}) else {
                return lhs + rhs
        }
        let lhsRange = lhsFirst..<lhs.endIndex
        let rhsRange = 0...rhsLast

        assert(lhsRange.count == rhsRange.count)

        guard
            let rhsIndexAfterIntersection = rhsRange.first(where: {
                rhs[$0].y <= lhs[$0 + lhsFirst].y
            }) else {
            return lhs + rhs
        }

        return Array(lhs[0..<rhsIndexAfterIntersection + lhsFirst] + rhs[rhsIndexAfterIntersection..<rhs.endIndex])
    }
}
