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
    
    private var shapeIndexSelected: Int?
    
    private let cellSize = CGSize(width: 128, height: 128)
    
    private var collectionViewLayout: UICollectionViewFlowLayout!
    
    private var collectionView: UICollectionView! {
        return (self.view as! UICollectionView)
    }
    
    let cellIdentifier = "shapeCell"
    
    // MARK: - Lifecycle
    
    override func loadView() {
        collectionViewLayout = UICollectionViewFlowLayout()
        view = UICollectionView(frame: CGRect.zero, collectionViewLayout: collectionViewLayout)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//        let storyboard = UIStoryboard(name: "Main", bundle: nil)
//        guard let shapeControlViewController = storyboard.instantiateViewController(identifier: "ShapeControlViewController") as? ShapeControlViewController else { return }
//        shapeControlViewController.shape = shapes[0]
//        show(shapeControlViewController, sender: self)
//    }
    
    // MARK: - View Methods
    
    func setUpViews() {
        collectionView.register(ShapeCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func updateViews() {
        collectionView.reloadData()
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
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as? ShapeCell else { return UICollectionViewCell() }
        cell.configure(with: shapes[indexPath.row], for: cellSize)
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension ShapesViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let shapeControlViewController = storyboard.instantiateViewController(identifier: "ShapeControlViewController") as? ShapeControlViewController else { return }
        shapeIndexSelected = indexPath.row
        shapeControlViewController.shape = shapes[indexPath.row]
        shapeControlViewController.delegate = self
        show(shapeControlViewController, sender: self)
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

// MARK: - ShapeControlViewControllerDelegate

extension ShapesViewController: ShapeControlViewControllerDelegate {
    
    func shapeName(is name: String) {
        guard let shapeIndexSelected = shapeIndexSelected else { return }
        guard name != shapes[shapeIndexSelected].name else { return }
        shapeController.update(name: name, atIndex: shapeIndexSelected)
        updateViews()
    }
    
    func strokeColorChanged(to color: Color) {
        guard let shapeIndexSelected = shapeIndexSelected else { return }
        shapeController.update(strokeColor: color, atIndex: shapeIndexSelected)
        updateViews()
    }
    
    func strokeWidthChanged(to strokeWidth: StrokeWidth) {
        guard let shapeIndexSelected = shapeIndexSelected else { return }
        shapeController.update(strokeWidth: strokeWidth, atIndex: shapeIndexSelected)
        updateViews()
    }
    
    func fillColorChanged(to color: Color) {
        guard let shapeIndexSelected = shapeIndexSelected else { return }
        shapeController.update(fillColor: color, atIndex: shapeIndexSelected)
        updateViews()
    }
}
