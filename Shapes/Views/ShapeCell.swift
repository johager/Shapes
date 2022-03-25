//
//  ShapeCell.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class ShapeCell: UICollectionViewCell {
    
    var size: CGSize!
    let margin: CGFloat = 16
    
    var shapeLayer: CAShapeLayer!
    
    // MARK: - View Methods
    
    func configure(with shape: Shape, for cellSize: CGSize) {
        setUpView(for: cellSize)
        createShape(shape, for: cellSize)
    }
    
    func setUpView(for cellSize: CGSize) {
        guard size == nil else { return }
        size = CGSize(width: cellSize.width - 2 * margin, height: cellSize.height - 2 * margin)
        shapeLayer = CAShapeLayer()
        contentView.layer.addSublayer(shapeLayer)
    }
    
    func createShape(_ shape: Shape, for cellSize: CGSize) {        
        shapeLayer.path = path(for: shape).cgPath
        shapeLayer.fillColor = shape.fillColor.uiColor.cgColor
        shapeLayer.lineWidth = shape.strokeWidth.cgFloat
        shapeLayer.strokeColor = shape.strokeColor.uiColor.cgColor
        shapeLayer.lineCap = .square
    }
    
    func path(for shape: Shape) -> UIBezierPath {
        switch shape.shapeType {
        case .circle:
            return UIBezierPath(ovalIn: CGRect(x: margin, y: margin, width: size.width, height: size.height))
        case let .sided(numberOfSides):
            return pathFor(numberOfSides)
        }
    }
    
    func pathFor(_ numberOfSides: Int) -> UIBezierPath {
        switch numberOfSides {
        case 3:
            let topCenter = CGPoint(x: margin + size.width / 2, y: margin)
            let path = UIBezierPath()
            path.move(to: topCenter)  // top center
            path.addLine(to: CGPoint(x: margin, y: margin + size.height))  // bottom left
            path.addLine(to: CGPoint(x: margin + size.width, y: margin + size.height))  // bottom right
            path.addLine(to: topCenter)  // top center
            return path
        case 4:
            let topLeft = CGPoint(x: margin, y: margin)
            let path = UIBezierPath()
            path.move(to: topLeft)  // top left
            path.addLine(to: CGPoint(x: margin, y: margin + size.height))  // bottom left
            path.addLine(to: CGPoint(x: margin + size.width, y: margin + size.height))  // bottom right
            path.addLine(to: CGPoint(x: margin + size.width, y: margin))  // top right
            path.addLine(to: topLeft)  // top left
            return path
            
        default:
            return UIBezierPath()
        }
    }
}
