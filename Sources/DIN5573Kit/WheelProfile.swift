//
//  WheelProfile.swift
//  
//
//  Created by André Rohrbeck on 16.01.23.
//

import Foundation

/// A Wheel Profile as defined in DIN 5573:1995.
///
/// Use ``DIN5573/profile(_:sr:width:ar:)`` to generate a wheel profile with the desired parameters.
public struct WheelProfile {

    /// The type of the wheel profile.
    ///
    /// DIN 5573 defines the E and the EH wheel profile type.
    public let type: WheelProfileType

    /// The front-to-front distance in mm.
    public let sr: Int

    /// The back-to-back distance in mm.
    public let ar: Int

    /// The wheel width in mm.
    public let width: Int

    /// The co-ordinates of the profile.
    public let profile: [CGPoint]
}



extension WheelProfile: CustomStringConvertible {
    public var description: String {
        "DIN 5573 – \(type) \(sr) – \(width) – \(ar)"
    }
}
