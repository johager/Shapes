//
//  ShapeCell.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class ShapeCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    var size: CGSize!
    let margin: CGFloat = 12
    
    // MARK: - View Methods
    
    func configure(with shape: Shape, for cellSize: CGSize) {
        setUpView(for: cellSize)
        createShape(shape, for: cellSize)
    }
    
    func setUpView(for cellSize: CGSize) {
        guard imageView == nil else { return }
        
        size = CGSize(width: cellSize.width - 2 * margin, height: cellSize.height - 2 * margin)
        
        imageView = UIImageView(frame: CGRect.zero)
        imageView.contentMode = .center
        imageView.add(to: contentView)
    }
    
    // override
    func createShape(_ shape: Shape, for cellSize: CGSize) {
    }
}
