//
//  UIView+constraints.swift
//  Weather_NWS
//
//  Created by James Hager on 8/25/18.
//  Copyright © 2018 Avanti Applications, LLC. All rights reserved.
//

import UIKit

extension UIView {
    
    func pinBottom(toBottomOf pinView: UIView, margin: CGFloat? = nil) {
        if let margin = margin {
            self.bottomAnchor.constraint(equalTo: pinView.bottomAnchor, constant: -margin).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: pinView.bottomAnchor).isActive = true
        }
    }
    
    func pinBottom(toBottomOf pinView: UIView, pinType: AAPinType, margin: CGFloat? = nil) {
        
        let pinViewBottomAnchor = yAxisAnchor(pinView: pinView, pinType: pinType, anchorPosition: .bottom)
        
        if let margin = margin {
            self.bottomAnchor.constraint(equalTo: pinViewBottomAnchor, constant: -margin).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: pinViewBottomAnchor).isActive = true
        }
    }
    
    func pinBottom(toTopOf pinView: UIView, margin: CGFloat? = nil) {
        if let margin = margin {
            self.bottomAnchor.constraint(equalTo: pinView.topAnchor, constant: -margin).isActive = true
        } else {
            self.bottomAnchor.constraint(equalTo: pinView.topAnchor).isActive = true
        }
    }
    
    func pinTop(toBottomOf pinView: UIView, margin: CGFloat? = nil) {
        if let margin = margin {
            self.topAnchor.constraint(equalTo: pinView.bottomAnchor, constant: margin).isActive = true
        } else {
            self.topAnchor.constraint(equalTo: pinView.bottomAnchor).isActive = true
        }
    }
    
    func pinLeft(toRightOf pinView: UIView, margin: CGFloat? = nil) {
        if let margin = margin {
            self.leftAnchor.constraint(equalTo: pinView.rightAnchor, constant: margin).isActive = true
        } else {
            self.leftAnchor.constraint(equalTo: pinView.rightAnchor).isActive = true
        }
    }
    
    func pinRight(toLeftOf pinView: UIView, margin: CGFloat? = nil) {
        if let margin = margin {
            self.rightAnchor.constraint(equalTo: pinView.leftAnchor, constant: -margin).isActive = true
        } else {
            self.rightAnchor.constraint(equalTo: pinView.leftAnchor).isActive = true
        }
    }
    
    // MARK: - Pin sides equal-to
    
    func pin(to pinView: UIView, pinType pinTypeIn: AAPinType? = nil, margin: CGFloat? = nil) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinType defaults to .superview
        // margin defaults to 0
        
        var pinType: AAPinType!
        
        if pinTypeIn == nil {
            pinType = .superview
        } else {
            pinType = pinTypeIn
        }
        
        self.pinTop(to: pinView, pinType: pinType, margin: margin)
        self.pinRight(to: pinView, pinType: pinType, margin: margin)
        self.pinBottom(to: pinView, pinType: pinType, margin: margin)
        self.pinLeft(to: pinView, pinType: pinType, margin: margin)
    }
    
    func pin(to pinView: UIView, pinTypes: [AAPinType?], margin: CGFloat? = nil) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinTypes is an array of [top, right, bottom, left]. If one side of the pinType is nil, that side isn't set.
        //
        // margin defaults to 0
        
        let margins: [CGFloat?] = [margin, margin, margin, margin]
        
        pin(to: pinView, pinTypes: pinTypes, margins: margins)
    }
    
    func pin(to pinView: UIView, pinTypes: [AAPinType?], margins: [CGFloat?]) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinTypes and margins is an array of [top, right, bottom, left].
        //
        // If one side of the pinType is nil, that side isn't set.
        //
        // margin defaults to 0
        
        if let pinType = pinTypes[0] {
            self.pinTop(to: pinView, pinType: pinType, margin: margins[0])
        }
        
        if let pinType = pinTypes[1] {
            self.pinRight(to: pinView, pinType: pinType, margin: margins[1])
        }
        
        if let pinType = pinTypes[2] {
            self.pinBottom(to: pinView, pinType: pinType, margin: margins[2])
        }
        
        if let pinType = pinTypes[3] {
            self.pinLeft(to: pinView, pinType: pinType, margin: margins[3])
        }
    }
    
    // MARK: - Pin sides greater-than-or-equal-to
    
    func pinGreaterThanOrEqual(to pinView: UIView, pinType pinTypeIn: AAPinType? = nil, margin marginIn: CGFloat? = nil) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinType defaults to .superview
        // margin defaults to 0
        
        var pinType: AAPinType!
        
        if pinTypeIn == nil {
            pinType = .superview
        } else {
            pinType = pinTypeIn
        }
        
        let margin = marginFrom(marginIn)
        
        self.pinTop(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        self.pinRight(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        self.pinBottom(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        self.pinLeft(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
    }
    
    func pinGreaterThanOrEqual(to pinView: UIView, pinTypes: [AAPinType?], margin marginIn: CGFloat? = nil) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinTypes is an array of [top, right, bottom, left]. If one side of the pinType is nil, that side isn't set.
        //
        // margin defaults to 0
        
        let margin = marginFrom(marginIn)
        let margins: [CGFloat?] = [margin, margin, margin, margin]
        
        pinGreaterThanOrEqual(to: pinView, pinTypes: pinTypes, margins: margins)
    }
    
    func pinGreaterThanOrEqual(to pinView: UIView, pinTypes: [AAPinType?], margins: [CGFloat?]) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinTypes and margins is an array of [top, right, bottom, left].
        //
        // If one side of the pinType is nil, that side isn't set.
        //
        // margin defaults to 0
        
        var margin: CGFloat!
        
        if let pinType = pinTypes[0] {
            margin = marginFrom(margins[0])
            self.pinTop(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        }
        
        if let pinType = pinTypes[1] {
            margin = marginFrom(margins[1])
            self.pinRight(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        }
        
        if let pinType = pinTypes[2] {
            margin = marginFrom(margins[2])
            self.pinBottom(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        }
        
        if let pinType = pinTypes[3] {
            margin = marginFrom(margins[3])
            self.pinLeft(to: pinView, pinType: pinType, margin: margin, greaterThanOrEqualTo: true)
        }
    }
    
    func pinGreaterThanOrEqual(to pinView: UIView, pinType pinTypeIn: AAPinType?, margins: [CGFloat?]) {
        //print("=== UIView+constraints.\(#function) ===")
        // pin "all" sides to corresponding sides of pinView
        //
        // pinType defaults to .superview
        // margins is an array of [top, right, bottom, left].
        //
        // margin defaults to 0
        
        var pinType: AAPinType!
        
        if pinTypeIn == nil {
            pinType = .superview
        } else {
            pinType = pinTypeIn
        }
        
        self.pinTop(to: pinView, pinType: pinType, margin: margins[0], greaterThanOrEqualTo: true)
        self.pinRight(to: pinView, pinType: pinType, margin: margins[1], greaterThanOrEqualTo: true)
        self.pinBottom(to: pinView, pinType: pinType, margin: margins[2], greaterThanOrEqualTo: true)
        self.pinLeft(to: pinView, pinType: pinType, margin: margins[3], greaterThanOrEqualTo: true)
    }
    
    func pinTypeArrayDesc(_ pinTypeArray: [AAPinType?]) -> String {
        var pinTypeArrayDesc = "["
        var notFirstElement = false
        
        for pinType in pinTypeArray {
            if notFirstElement {
                pinTypeArrayDesc += ", "
            } else {
                notFirstElement = true
            }
            if let pinType = pinType {
                pinTypeArrayDesc += pinType.rawValue
            } else {
                pinTypeArrayDesc += "nil"
            }
        }
        pinTypeArrayDesc += "]"
        
        return pinTypeArrayDesc
    }
    
    func marginFrom(_ marginIn: CGFloat?) -> CGFloat {
        if marginIn == nil {
            return 0
        } else {
            return marginIn!
        }
    }
    
    // MARK: - Pin individual sides
    
    func pinTop(to pinView: UIView, pinType: AAPinType, margin: CGFloat? = nil, greaterThanOrEqualTo: Bool = false) {
        //print("=== UIView+constraints.\(#function) ===")
        
        let pinViewTopAnchor = yAxisAnchor(pinView: pinView, pinType: pinType, anchorPosition: .top)
        
        if let margin = margin {
            if greaterThanOrEqualTo {
                print("=== UIView+constraints.\(#function) === greaterThanOrEqualTo, constant: \(margin)")
                self.topAnchor.constraint(greaterThanOrEqualTo: pinViewTopAnchor, constant: margin).isActive = true
            } else {
                self.topAnchor.constraint(equalTo: pinViewTopAnchor, constant: margin).isActive = true
            }
        } else {
            self.topAnchor.constraint(equalTo: pinViewTopAnchor).isActive = true
        }
    }
    
    func pinRight(to pinView: UIView, pinType: AAPinType, margin: CGFloat? = nil, greaterThanOrEqualTo: Bool = false) {
        //print("=== UIView+constraints.\(#function) ===")
        
        let pinViewRightAnchor = xAxisAnchor(pinView: pinView, pinType: pinType, anchorPosition: .right)
        
        if let margin = margin {
            if greaterThanOrEqualTo {
                print("=== UIView+constraints.\(#function) === greaterThanOrEqualTo, constant: \(-margin)")
                self.rightAnchor.constraint(lessThanOrEqualTo: pinViewRightAnchor, constant: -margin).isActive = true
            } else {
                self.rightAnchor.constraint(equalTo: pinViewRightAnchor, constant: -margin).isActive = true
            }
        } else {
            self.rightAnchor.constraint(equalTo: pinViewRightAnchor).isActive = true
        }
    }
    
    func pinBottom(to pinView: UIView, pinType: AAPinType, margin: CGFloat? = nil, greaterThanOrEqualTo: Bool = false, priority: Float? = nil) {
        //print("=== UIView+constraints.\(#function) ===")
        
        let pinViewBottomAnchor = yAxisAnchor(pinView: pinView, pinType: pinType, anchorPosition: .bottom)
        
        if let margin = margin {
            if greaterThanOrEqualTo {
                print("=== UIView+constraints.\(#function) === greaterThanOrEqualTo, constant: \(-margin)")
                let constraint = self.bottomAnchor.constraint(lessThanOrEqualTo: pinViewBottomAnchor, constant: -margin)
                if let priority = priority {
                    constraint.priority = UILayoutPriority(rawValue: priority)
                }
                constraint.isActive = true
                
            } else {
                self.bottomAnchor.constraint(equalTo: pinViewBottomAnchor, constant: -margin).isActive = true
            }
        } else {
            self.bottomAnchor.constraint(equalTo: pinViewBottomAnchor).isActive = true
        }
    }
    
    func pinLeft(to pinView: UIView, pinType: AAPinType, margin: CGFloat? = nil, greaterThanOrEqualTo: Bool = false) {
        //print("=== UIView+constraints.\(#function) ===")
        
        let pinViewLeftAnchor = xAxisAnchor(pinView: pinView, pinType: pinType, anchorPosition: .left)
        
        if let margin = margin {
            if greaterThanOrEqualTo {
                print("=== UIView+constraints.\(#function) === greaterThanOrEqualTo, constant: \(margin)")
                self.leftAnchor.constraint(greaterThanOrEqualTo: pinViewLeftAnchor, constant: margin).isActive = true
            } else {
                self.leftAnchor.constraint(equalTo: pinViewLeftAnchor, constant: margin).isActive = true
            }
        } else {
            self.leftAnchor.constraint(equalTo: pinViewLeftAnchor).isActive = true
        }
    }
    
    // MARK: - Anchors
    
    enum XAnchorPosition {
        case left
        case right
    }
    
    enum YAnchorPosition {
        case bottom
        case top
    }
    
    func xAxisAnchor(pinView: UIView, pinType: AAPinType, anchorPosition: XAnchorPosition) -> NSLayoutXAxisAnchor {
        
        var pinViewAnchor: NSLayoutXAxisAnchor!
        
        switch (pinType, anchorPosition) {
        case (.superview, .left):
            pinViewAnchor = pinView.leftAnchor
        case (.superview, .right):
            pinViewAnchor = pinView.rightAnchor
        case (.layoutMargin, .left):
            pinViewAnchor = pinView.layoutMarginsGuide.leftAnchor
        case (.layoutMargin, .right):
            pinViewAnchor = pinView.layoutMarginsGuide.rightAnchor
        case (.safeArea, .left):
            pinViewAnchor = pinView.safeAreaLayoutGuide.leftAnchor
        case (.safeArea, .right):
            pinViewAnchor = pinView.safeAreaLayoutGuide.rightAnchor
        }
        
        return pinViewAnchor
    }
    
    func yAxisAnchor(pinView: UIView, pinType: AAPinType, anchorPosition: YAnchorPosition) -> NSLayoutYAxisAnchor {
        
        var pinViewAnchor: NSLayoutYAxisAnchor!
        
        switch (pinType, anchorPosition) {
        case (.superview, .bottom):
            pinViewAnchor = pinView.bottomAnchor
        case (.superview, .top):
            pinViewAnchor = pinView.topAnchor
        case (.layoutMargin, .bottom):
            pinViewAnchor = pinView.layoutMarginsGuide.bottomAnchor
        case (.layoutMargin, .top):
            pinViewAnchor = pinView.layoutMarginsGuide.topAnchor
        case (.safeArea, .bottom):
            pinViewAnchor = pinView.safeAreaLayoutGuide.bottomAnchor
        case (.safeArea, .top):
            pinViewAnchor = pinView.safeAreaLayoutGuide.topAnchor
        }
        
        return pinViewAnchor
    }
}

