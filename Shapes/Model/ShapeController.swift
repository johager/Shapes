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
            Shape(name: "Circle", shapeType: .circle, strokeColor: .black, strokeWidth: .three, fillColor: .red),
            Shape(name: "Triangle", shapeType: .sided(3), strokeColor: .black, strokeWidth: .three, fillColor: .blue),
            Shape(name: "Square", shapeType: .sided(4), strokeColor: .black, strokeWidth: .three, fillColor: .yellow),
            Shape(name: "Pentagon", shapeType: .sided(5), strokeColor: .black, strokeWidth: .three, fillColor: .green),
            Shape(name: "Hexagon", shapeType: .sided(6), strokeColor: .black, strokeWidth: .three, fillColor: .cyan),
            Shape(name: "Septagon", shapeType: .sided(7), strokeColor: .black, strokeWidth: .three, fillColor: .teal),
            Shape(name: "Octagon", shapeType: .sided(8), strokeColor: .black, strokeWidth: .three, fillColor: .mint),
            Shape(name: "Nonagon", shapeType: .sided(9), strokeColor: .black, strokeWidth: .three, fillColor: .gray)
        ]
    }
     
    // MARK: - CRUD
    
    func createShape(name: String, shapeType: ShapeType, strokeColor: Color, strokeWidth: StrokeWidth, fillColor: Color) {
        shapes.append(Shape(name: name, shapeType: shapeType, strokeColor: strokeColor, strokeWidth: strokeWidth, fillColor: fillColor))
        sort()
    }
    
    func didUpdate(name: String, atIndex index: Int) -> Bool {
        guard name != shapes[index].name else { return false }
        shapes[index].update(name: name)
        return true
    }
    
    func didUpdate(strokeColor: Color, atIndex index: Int) -> Bool {
        guard strokeColor != shapes[index].strokeColor else { return false }
        shapes[index].update(strokeColor: strokeColor)
        return true
    }
    
    func didUpdate(strokeWidth: StrokeWidth, atIndex index: Int) -> Bool {
        guard strokeWidth != shapes[index].strokeWidth else { return false }
        shapes[index].update(strokeWidth: strokeWidth)
        return true
    }
    
    func didUpdate(fillColor: Color, atIndex index: Int) -> Bool {
        guard fillColor != shapes[index].fillColor else { return false }
        shapes[index].update(fillColor: fillColor)
        return true
    }
    
    // MARK: - Methods
    
    func sort() {
        guard shapes.count > 1 else { return }
        shapes.sort(by: {$0.name < $1.name})
    }
}
