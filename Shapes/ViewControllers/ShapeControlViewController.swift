//
//  ShapeControlViewController.swift
//  Shapes
//
//  Created by James Hager on 3/24/22.
//

import UIKit

protocol ShapeControlViewControllerDelegate: AnyObject {
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
    
    weak var delegate: ShapeControlViewControllerDelegate?
    
    private var strokeColorMenu: UIMenu!
    private var strokeWidthMenu: UIMenu!
    private var fillColorMenu: UIMenu!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
    }
    
    // MARK: - View Methods
    
    func setUpViews() {
        
        // strokeColor
        
        let strokeColorMenuItems = colorMenuItems(withHandler: handleStrokeColorMenu)
        strokeColorMenu = UIMenu(title: "Stroke Color", image: nil, identifier: nil, options: [], children: strokeColorMenuItems)
        strokeColorButton.menu = strokeColorMenu
        strokeColorButton.changesSelectionAsPrimaryAction = true
        strokeColorButton.showsMenuAsPrimaryAction = true
        
        // strokeWidth
        
        let strokeWidthMenuItems = strokeWidthMenuItems(withHandler: handleStrokeWidthMenu)
        strokeWidthMenu = UIMenu(title: "Stroke Width", image: nil, identifier: nil, options: [], children: strokeWidthMenuItems)
        strokeWidthButton.menu = strokeWidthMenu
        strokeWidthButton.changesSelectionAsPrimaryAction = true
        strokeWidthButton.showsMenuAsPrimaryAction = true
        
        // fillColor
        
        let fillColorMenuItems = colorMenuItems(withHandler: handleFillColorMenu)
        fillColorMenu = UIMenu(title: "Fill Color", image: nil, identifier: nil, options: [], children: fillColorMenuItems)
        fillColorButton.menu = fillColorMenu
        fillColorButton.changesSelectionAsPrimaryAction = true
        fillColorButton.showsMenuAsPrimaryAction = true
    }
    
    func colorMenuItems(withHandler handler: @escaping (UIAction) -> Void) -> [UIAction] {
        var menuItems = [UIAction]()
        for color in Color.allCases {
            menuItems.append(UIAction(title: color.description, image: nil, handler: handler))
        }
        return menuItems
    }
    
    func strokeWidthMenuItems(withHandler handler: @escaping (UIAction) -> Void) -> [UIAction] {
        var menuItems = [UIAction]()
        for strokeWidth in StrokeWidth.allCases {
            menuItems.append(UIAction(title: strokeWidth.description, image: nil, handler: handler))
        }
        return menuItems
    }
    
    // MARK: - Actions

    let handleStrokeColorMenu = { (action: UIAction) in
        print("handleStrokeColorMenu - title: \(action.title)")
    }
    
    let handleStrokeWidthMenu = { (action: UIAction) in
        print("handleStrokeWidthMenu - title: \(action.title)")
    }
    
    let handleFillColorMenu = { (action: UIAction) in
        print("handleFillColorMenu - title: \(action.title)")
    }
}
