//
//  ShapeController.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class ShapeController {
    
    var shapes = [Shape]()
    
    // temp default data
    init() {
        shapes = [
            Shape(name: "Circle", shapeType: .circle, strokeColor: .black, strokeWidth: 4.0, fillColor: .red),
            Shape(name: "Square", shapeType: .sided(4), strokeColor: .black, strokeWidth: 4.0, fillColor: .blue)
        ]
    }
     
    // MARK: - CRUD
    
    func createShape(name: String, shapeType: ShapeType, strokeColor: UIColor, strokeWidth: CGFloat, fillColor: UIColor) {
        shapes.append(Shape(name: name, shapeType: shapeType, strokeColor: strokeColor, strokeWidth: strokeWidth, fillColor: fillColor))
        sort()
    }
    
    // MARK: - Methods
    
    func sort() {
        guard shapes.count > 1 else { return }
        shapes.sort(by: {$0.name < $1.name})
    }
}
