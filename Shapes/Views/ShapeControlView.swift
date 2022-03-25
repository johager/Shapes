//
//  ShapeControlView.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

protocol ShapeControlViewDelegate: AnyObject {
    func strokeColorChanged(to color: UIColor)
    func strokeWidthChanged(to width: CGFloat)
    func fillColorChanged(to color: UIColor)
}

// MARK: -

class ShapeControlView: UIView {

    // MARK: - Properties
    
    // MARK: - Views
    
    var strokeColorButton: UIButton!
    var strokeWidthButton: UIButton!
    var fillColorButton: UIButton!
    
    // MARK: - Actions
    
    
}
