//
//  ShapeControlViewController.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

protocol ShapeControlViewControllerDelegate: AnyObject {
    func shapeName(is name: String)
    func strokeColorChanged(to color: Color)
    func strokeWidthChanged(to width: StrokeWidth)
    func fillColorChanged(to color: Color)
}

// MARK: -

class ShapeControlViewController: UIViewController {

    // MARK: - Outlets
    
    @IBOutlet weak var shapeNameTextField: UITextField!
    @IBOutlet weak var strokeColorButton: UIButton!
    @IBOutlet weak var strokeWidthButton: UIButton!
    @IBOutlet weak var fillColorButton: UIButton!
    
    // MARK: - Properties
    
    var shape: Shape!
    
    weak var delegate: ShapeControlViewControllerDelegate?
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - View Methods
    
    func setUpViews() {
        
        // shapeName
        
        shapeNameTextField.text = shape.name
        
        // strokeColor
        
        let strokeColorMenuItems = colorMenuItems(selected: shape.strokeColor, handler: handleStrokeColorMenu(_:))
        let strokeColorMenu = UIMenu(title: "Stroke Color", image: nil, identifier: nil, options: [], children: strokeColorMenuItems)
        strokeColorButton.menu = strokeColorMenu
        strokeColorButton.changesSelectionAsPrimaryAction = true
        strokeColorButton.showsMenuAsPrimaryAction = true
        
        // strokeWidth
        
        let strokeWidthMenuItems = strokeWidthMenuItems(selected: shape.strokeWidth, handler: handleStrokeWidthMenu(_:))
        let strokeWidthMenu = UIMenu(title: "Stroke Width", image: nil, identifier: nil, options: [], children: strokeWidthMenuItems)
        strokeWidthButton.menu = strokeWidthMenu
        strokeWidthButton.changesSelectionAsPrimaryAction = true
        strokeWidthButton.showsMenuAsPrimaryAction = true
        
        // fillColor
        
        let fillColorMenuItems = colorMenuItems(selected: shape.fillColor, handler: handleFillColorMenu(_:))
        let fillColorMenu = UIMenu(title: "Fill Color", image: nil, identifier: nil, options: [], children: fillColorMenuItems)
        fillColorButton.menu = fillColorMenu
        fillColorButton.changesSelectionAsPrimaryAction = true
        fillColorButton.showsMenuAsPrimaryAction = true
    }
    
    func colorMenuItems(selected colorSelected: Color, handler: @escaping (UIAction) -> Void) -> [UIAction] {
        var menuItems = [UIAction]()
        for color in Color.allCases {
            if color == colorSelected {
                menuItems.append(UIAction(title: color.description, image: nil, state: .on, handler: handler))
            } else {
                menuItems.append(UIAction(title: color.description, image: nil, handler: handler))
            }
        }
        return menuItems
    }
    
    func strokeWidthMenuItems(selected strokeWidthSelected: StrokeWidth, handler: @escaping (UIAction) -> Void) -> [UIAction] {
        var menuItems = [UIAction]()
        for strokeWidth in StrokeWidth.allCases {
            if strokeWidth == strokeWidthSelected {
                menuItems.append(UIAction(title: strokeWidth.description, image: nil, state: .on, handler: handler))
            } else {
                menuItems.append(UIAction(title: strokeWidth.description, image: nil, handler: handler))
            }
        }
        return menuItems
    }
    
    // MARK: - Actions

    @objc func handleStrokeColorMenu(_ action: UIAction) {
        delegate?.strokeColorChanged(to: Color(rawValue: action.title)!)
    }
    
    @objc func handleStrokeWidthMenu(_ action: UIAction) {
        delegate?.strokeWidthChanged(to: StrokeWidth(rawValue: Int(action.title)!)!)
    }
    
    @objc func handleFillColorMenu(_ action: UIAction) {
        delegate?.fillColorChanged(to: Color(rawValue: action.title)!)
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        if let name = shapeNameTextField?.text {
            delegate?.shapeName(is: name)
        }
        dismiss(animated: true)
    }
}
