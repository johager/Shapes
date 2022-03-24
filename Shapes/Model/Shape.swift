//
//  Shape.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class Shape {
    
    var name: String
    var shapeType: ShapeType
    var strokeColor: UIColor
    var strokeWidth: CGFloat
    var fillColor: UIColor
    
    init(name: String, shapeType: ShapeType, strokeColor: UIColor = .black, strokeWidth: CGFloat = 4, fillColor: UIColor = .white) {
        self.name = name
        self.shapeType = shapeType
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.fillColor = fillColor
    }
}
