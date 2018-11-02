//
//  LayoutHelper.swift
//  Queen City Parse
//
//  Created by Robert Barber on 10/31/18.
//  Copyright © 2018 Rob Barber. All rights reserved.
//

import UIKit

extension UIView {
    
    //MARK:- Inserting Subviews
    func addAndExpand(_ view: UIView) {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        self.addSubview(view)
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    /** Adopts the size and location of a view */
    func centerAndResizeOn(_ view: UIView,
                           xOffset: CGFloat = 0, yOffset: CGFloat = 0,
                           widthMultiplier: CGFloat = 1, heightMultiplier: CGFloat = 1) {
        
        self.alignTo(centerOf: view, xOffset: xOffset, yOffset: yOffset)
        self.setSize(to: view, xMultiplier: widthMultiplier, yMultiplier: heightMultiplier)
    }
    
    func setSize(width: CGFloat, height: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
        
    }
    
    func setSize(to view:UIView, xMultiplier: CGFloat = 1, yMultiplier: CGFloat = 1) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: xMultiplier).isActive = true
        self.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: yMultiplier).isActive = true
    }
    
}

//MARK:- Aligning views
extension UIView {
    
    //MARK: Alignment to superview or siblings
    
    /**
     Aligns this view's center to the center of the reference view
     
     - parameters:
     - view: The reference view to center this view to
     - xOffset: The horizontal offset from the center of the reference view that this view's center should be located
     - yOffset: The vertical offset from the center of the reference view that this view's center should be located
     */
    func alignTo(centerOf view: UIView, xOffset: CGFloat = 0, yOffset: CGFloat = 0) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
    }
    
    //MARK: Alignment to superview
    
    /**
     Aligns this view's bottom anchor to the reference view's bottom anchor. Also centers
     this view horizontally to the reference view's horizontal center.
     
     - parameters:
     - view: The reference view to base this view's position off of
     - xOffset: The horizontal adjustment from the center of the reference view
     - yOffset: The vertical adjustment from the bottom anchor of the reference view
     */
    func alignTo(bottomOf view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffset).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
    }
    
    /**
     Aligns this view's top anchor to the reference view's top anchor. Also centers
     this view horizontally to the reference view's horizontal center.
     
     - parameters:
     - view: The reference view to base this view's position off of
     - xOffset: The horizontal adjustment from the center of the reference view
     - yOffset: The vertical adjustment from the top anchor of the reference view
     */
    func alignTo(topOf view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: view.topAnchor, constant: yOffset).isActive = true
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
    }
    
    /**
     Aligns this view's leading anchor to the reference view's leading anchor. Also centers
     this view vertically to the reference view's vertical center.
     
     - parameters:
     - view: The reference view to base this view's position off of
     - xOffset: The horizontal adjustment from the leading edge of the reference view
     - yOffset: The vertical adjustment from the vertical center of the reference view
     */
    func alignTo(leadingOf view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
        
    }
    
    /**
     Aligns this view's trailing anchor to the reference view's trailing anchor. Also centers
     this view vertically to the reference view's vertical center.
     
     - parameters:
     - view: The reference view to base this view's position off of
     - xOffset: The horizontal adjustment from the trailing edge of the reference view
     - yOffset: The vertical adjustment from the vertical center of the reference view
     */
    func alignTo(trailingOf view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: xOffset).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
        
    }
    
    //MARK: Alignment to siblings
    
    func alignCenter(above view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
        self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: yOffset).isActive = true
        
    }
    
    func alignCenter(below view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
        self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffset).isActive = true
        
    }
    
    func alignCenter(before view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
        
    }
    
    func alignCenter(after view:UIView, xOffset:CGFloat, yOffset:CGFloat) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: xOffset).isActive = true
        self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
    }
}
