//
//  AAPinType.swift
//  Weather_NWS
//
//  Created by James Hager on 8/25/18.
//  Copyright © 2018 Avanti Applications, LLC. All rights reserved.
//

import Foundation

enum AAPinType: String, CustomStringConvertible {
    case superview
    case layoutMargin
    case safeArea
    
    public var description: String { return rawValue }
}
