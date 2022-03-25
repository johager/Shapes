//
//  UIView+add.swift
//  Weather_NWS
//
//  Created by James Hager on 8/20/18.
//  Copyright © 2018 Avanti Applications, LLC. All rights reserved.
//

import UIKit

extension UIView {
    
    func addWithoutPinning(to parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
    }
    
    func addWithCenterConstraints(to parentView: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor).isActive = true
    }
    
    func addWithCenterConstraints(to parentView: UIView, offsetY: CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: parentView.centerYAnchor, constant: offsetY).isActive = true
    }
    
    func addWithCenterXConstraint(to parentView: UIView, yTopPinType: AAPinType? = nil, margin: CGFloat? = nil) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        
        self.centerXAnchor.constraint(equalTo: parentView.centerXAnchor).isActive = true
        
        guard let yTopPinType = yTopPinType else { return }
        
        self.pinTop(to: parentView, pinType: yTopPinType, margin: margin)
    }
    
    // Add to view and pin to that view
    
    func add(to parentView: UIView, pinType: AAPinType? = nil, margin: CGFloat? = nil) {
        var pinTypes: [AAPinType?]!
        
        if let pinType = pinType {
            pinTypes = [pinType, pinType, pinType, pinType]
        } else {
            pinTypes = [.superview, .superview, .superview, .superview]
        }
        
        add(to: parentView, pinTypes: pinTypes, margin: margin)
    }
    
    func add(to parentView: UIView, pinTypes: [AAPinType?], margin: CGFloat? = nil) {
        let margins: [CGFloat?] = [margin, margin, margin, margin]
        add(to: parentView, pinTypes: pinTypes, margins: margins)
    }
    
    func add(to parentView: UIView, pinType: AAPinType? = nil, margins: [CGFloat?]) {
        var pinTypes: [AAPinType?]!
        
        if let pinType = pinType {
            pinTypes = [pinType, pinType, pinType, pinType]
        } else {
            pinTypes = [.superview, .superview, .superview, .superview]
        }
        
        add(to: parentView, pinTypes: pinTypes, margins: margins)
    }
    
    func add(to parentView: UIView, pinTypes: [AAPinType?], margins: [CGFloat?]) {
        add(to: parentView, andPinTo: parentView, pinTypes: pinTypes, margins: margins)
    }
    
    // Add to view and pin to a different view
    
    func add(to parentView: UIView, andPinTo pinView: UIView, pinType: AAPinType? = nil, margin: CGFloat? = nil) {
        
        if pinType == nil && margin == nil {
            self.translatesAutoresizingMaskIntoConstraints = false
            parentView.addSubview(self)
            
            self.topAnchor.constraint(equalTo: pinView.topAnchor).isActive = true
            self.bottomAnchor.constraint(equalTo: pinView.bottomAnchor).isActive = true
            self.leftAnchor.constraint(equalTo: pinView.leftAnchor).isActive = true
            self.rightAnchor.constraint(equalTo: pinView.rightAnchor).isActive = true
            
            return
        }
        
        var pinTypes: [AAPinType?]!
        
        if let pinType = pinType {
            pinTypes = [pinType, pinType, pinType, pinType]
        } else {
            pinTypes = [.superview, .superview, .superview, .superview]
        }
        
        add(to: parentView, andPinTo: pinView, pinTypes: pinTypes, margin: margin)
    }
    
    func add(to parentView: UIView, andPinTo pinView: UIView, pinTypes: [AAPinType?], margin: CGFloat? = nil) {
        let margins: [CGFloat?] = [margin, margin, margin, margin]
        add(to: parentView, andPinTo: pinView, pinTypes: pinTypes, margins: margins)
    }
    
    func add(to parentView: UIView, andPinTo pinView: UIView, pinTypes: [AAPinType?], margins: [CGFloat?]) {
        self.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(self)
        
        self.pin(to: pinView, pinTypes: pinTypes, margins: margins)
    }
}
