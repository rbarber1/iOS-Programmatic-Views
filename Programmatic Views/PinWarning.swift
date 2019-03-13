//
//  PinWarning.swift
//  ProgrammaticViews
//
//  Created by Robert Barber on 3/13/19.
//

import Foundation

/**
 Warnings about pinning views blah blah
 */
public enum PinWarning:String {
    case xPinOnYEdge = "WARNING: Can't pin X-layout anchor to a Y-layout anchor"
    case yPinOnXEdge = "WARNING: Can't pin Y-layout anchor to a X-layout anchor"
}
