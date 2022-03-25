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
        // inspired https://www.hackingwithswift.com/quick-start/swiftui/how-to-draw-polygons-and-stars
        
        let center = CGPoint(x: size.width / 2, y: size.height / 2)
        
        // start from directly upwards
        var currentAngle = -CGFloat.pi / 2
        
        let angleAdjustment = .pi * 2 / CGFloat(numberOfSides)
        
        // track the lowest point we draw to, so we can center later
        var bottomEdge: CGFloat = 0
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: center.x * cos(currentAngle), y: center.y * sin(currentAngle)))
        
        for _ in 0...numberOfSides  {
            let sinAngle = sin(currentAngle)
            let cosAngle = cos(currentAngle)
            let bottom = center.y * sinAngle
            bottomEdge = max(bottomEdge, bottom)
            path.addLine(to: CGPoint(x: center.x * cosAngle, y: bottom))
            currentAngle += angleAdjustment
        }
        
        // figure out how much unused space we have at the bottom of our drawing rectangle
        let unusedSpace = (size.height / 2 - bottomEdge) / 2
        
        // create and apply a transform that moves the path down by that amount, centering the shape vertically
        let transform = CGAffineTransform(translationX: margin + size.width / 2, y: margin + size.height / 2 + unusedSpace)
        path.apply(transform)
        
        return path
    }
}
