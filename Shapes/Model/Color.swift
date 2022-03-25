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
    case cyan = "Cyan"
    case yellow = "Yellow"
    case teal = "Teal"
    case mint = "Mint"
    case gray = "Gray"
    case black = "Black"
    
    var uiColor: UIColor {
        switch self {
        case .red: return .systemRed
        case .green: return .systemGreen
        case .blue: return .systemBlue
        case .cyan: return .systemCyan
        case .yellow: return .systemYellow
        case .teal: return .systemTeal
        case .mint: return .systemMint
        case .gray: return .systemGray
        case .black: return .black
        }
    }
    
    var description: String {
        return rawValue
    }
}
