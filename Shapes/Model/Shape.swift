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
    var strokeColor: Color
    var strokeWidth: StrokeWidth
    var fillColor: Color
    
    init(name: String, shapeType: ShapeType, strokeColor: Color = .black, strokeWidth: StrokeWidth = .four, fillColor: Color = .black) {
        self.name = name
        self.shapeType = shapeType
        self.strokeColor = strokeColor
        self.strokeWidth = strokeWidth
        self.fillColor = fillColor
    }
    
    func update(name: String) {
        self.name = name
    }
    
    func update(strokeColor: Color) {
        self.strokeColor = strokeColor
    }
    
    func update(strokeWidth: StrokeWidth) {
        self.strokeWidth = strokeWidth
    }
    
    func update(fillColor: Color) {
        self.fillColor = fillColor
    }
}
