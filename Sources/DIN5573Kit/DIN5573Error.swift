//
//  DIN5573Error.swift
//  
//
//  Created by André Rohrbeck on 16.01.23.
//

import Foundation


/// Errors which may occur, when creating a DIN 5573 wheel profile.
public enum DIN5573Error: Error {

    /// The provided front-to-front distance has  an illegal value.
    ///
    /// Check ``DIN5573/validSR``to get the valid values.
    case invalidSR

    /// The provided wheel width has an illegal value.
    ///
    /// Check ``DIN5573/validWidth`` to get the valid values.
    case invalidWidth

    /// The provided wheel back-to-back distance has an illegal value.
    ///
    /// Check ``DIN5573/validAR`` to get the valid values.
    case invalidAR

}
