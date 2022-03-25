//
//  StrokeWidth.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

enum StrokeWidth: Int, CaseIterable, CustomStringConvertible {
    case one = 1
    case two = 2
    case three = 3
    case four = 4
    case five = 5
    
    var cgFloat: CGFloat {
        switch self {
        case .one: return 1
        case .two: return 2
        case .three: return 3
        case .four: return 4
        case .five: return 5
        }
    }
    
    var description: String {
        return "\(rawValue)"
    }
}
