//
//  Color.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

enum Color: String, CaseIterable, CustomStringConvertible {
    case red = "Red"
    case green = "Green"
    case blue = "Blue"
    case yellow = "Yellow"
    case black = "Black"
    
    var uiColor: UIColor {
        switch self {
        case .red: return .systemRed
        case .green: return .systemGreen
        case .blue: return .systemBlue
        case .yellow: return .systemYellow
        case .black: return .black
        }
    }
    
    var description: String {
        return rawValue
    }
}
