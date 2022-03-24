//
//  SidedCell.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class SidedCell: ShapeCell {
    
    // MARK: - View Methods
    
    override func createShape(_ shape: Shape, for cellSize: CGSize) {
        
        let renderer = UIGraphicsImageRenderer(size: cellSize)
        
        imageView.image = renderer.image { ctx in
            ctx.cgContext.setFillColor(shape.fillColor.cgColor)
            ctx.cgContext.setStrokeColor(shape.strokeColor.cgColor)
            ctx.cgContext.setLineWidth(shape.strokeWidth)
            
            let rectangle = CGRect(origin: CGPoint(x: margin, y: margin), size: size)
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)
        }
    }
}
