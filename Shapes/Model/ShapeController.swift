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
            Shape(name: "Circle", shapeType: .circle, strokeColor: .black, strokeWidth: .four, fillColor: .red),
            Shape(name: "Triangle", shapeType: .sided(3), strokeColor: .black, strokeWidth: .four, fillColor: .blue),
            Shape(name: "Square", shapeType: .sided(4), strokeColor: .black, strokeWidth: .four, fillColor: .yellow)
        ]
    }
     
    // MARK: - CRUD
    
    func createShape(name: String, shapeType: ShapeType, strokeColor: Color, strokeWidth: StrokeWidth, fillColor: Color) {
        shapes.append(Shape(name: name, shapeType: shapeType, strokeColor: strokeColor, strokeWidth: strokeWidth, fillColor: fillColor))
        sort()
    }
    
    func update(name: String, atIndex index: Int) {
        shapes[index].update(name: name)
    }
    
    func update(strokeColor: Color, atIndex index: Int) {
        shapes[index].update(strokeColor: strokeColor)
    }
    
    func update(strokeWidth: StrokeWidth, atIndex index: Int){
        shapes[index].update(strokeWidth: strokeWidth)
    }
    
    func update(fillColor: Color, atIndex index: Int) {
        shapes[index].update(fillColor: fillColor)
    }
    
    // MARK: - Methods
    
    func sort() {
        guard shapes.count > 1 else { return }
        shapes.sort(by: {$0.name < $1.name})
    }
}
