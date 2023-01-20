//
//  WheelProfileType.swift
//  
//
//  Created by André Rohrbeck on 16.01.23.
//

import Foundation


/// The type of wheel profiles as defined in DIN 5573:1995.
///
/// DIN 5573 defines two wheel profile types: 'E' and 'EH'. Which profile shall be chosen
/// depends on the wheel diameter. for wheels up to but not including 760 mm diameter
/// the profile 'EH' should be chosen, for wheels with 760 mm or larger diameter 'E' shall be
/// chosen.
public enum WheelProfileType {
    /// The profile type for wheels with a diameter larger or equal to 760 mm.
    case e

    /// The profile type for wheels with a diameter smaller than 760 mm.
    case eh
}



extension WheelProfileType: CustomStringConvertible {
    public var description: String {
        switch self {
        case .e: return "E"
        case .eh: return "EH"
        }
    }
}
