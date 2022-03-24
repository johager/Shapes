//
//  ShapesViewController.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

class ShapesViewController: UIViewController {
    
    // MARK: - Properties
    
    private let shapeController = ShapeController()
    
    private var shapes: [Shape] {
        return shapeController.shapes
    }
    
    private let cellSize = CGSize(width: 128, height: 128)
    
    private var collectionViewLayout: UICollectionViewFlowLayout!
    
    private var collectionView: UICollectionView! {
        return (self.view as! UICollectionView)
    }
    
    struct CellIdentifier {
        static let circle = "circleCell"
        static let sided = "sidedCell"
    }
    
    // MARK: - Lifecycle
    
    override func loadView() {
        collectionViewLayout = UICollectionViewFlowLayout()
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - View Methods
    
    func setUpViews() {
        collectionView.register(CircleCell.self, forCellWithReuseIdentifier: CellIdentifier.circle)
        collectionView.register(SidedCell.self, forCellWithReuseIdentifier: CellIdentifier.sided)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateViews() {
        
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
}

// MARK: - UICollectionViewDataSource

extension ShapesViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        shapeController.shapes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let shape = shapes[indexPath.row]
        switch shape.shapeType {
        case .circle:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.circle, for: indexPath) as? CircleCell else { return UICollectionViewCell() }
            cell.configure(with: shape, for: cellSize)
            return cell
        case .sided:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellIdentifier.sided, for: indexPath) as? SidedCell else { return UICollectionViewCell() }
            cell.configure(with: shape, for: cellSize)
            return cell
        }
    }
}

// MARK: - UICollectionViewDelegate

extension ShapesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: show detail VC
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension ShapesViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return cellSize
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(8)
    }
}
