//
//  LayoutHelper.swift
//  Queen City Parse
//
//  Created by Robert Barber on 10/31/18.
//  Copyright © 2018 Rob Barber. All rights reserved.
//

import UIKit

public extension UIView {
    
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
        
        self.align(to: .center, within: view, xOffset: xOffset, yOffset: yOffset)
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
    
    /**
     Aligns this view to the given edge within the second view and centers it along that edge.
     
     - parameters:
         - toEdge: The edge of the other view to align to
         - view: The other view to align to
         - xOffset: The x offset
         - yOffset: The y offset
     */
    func align(to toEdge:ViewEdge, within view:UIView, xOffset:CGFloat = 0, yOffset:CGFloat = 0, safeArea:Bool = false) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch toEdge {
            
        case .top:
            let anchor = safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
            self.topAnchor.constraint(equalTo: anchor, constant: yOffset).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            
        case .bottom:
            let anchor = safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
            self.bottomAnchor.constraint(equalTo: anchor, constant: yOffset).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            
        case .leading:
            let anchor = safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
            self.leadingAnchor.constraint(equalTo: anchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        case .trailing:
            let anchor = safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
            self.leadingAnchor.constraint(equalTo: anchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        case .center:
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            
            
        }
        
    }
    
    /**
     Aligns this view to the given edge outside the second view and centers it along that edge.
     
     - parameters:
         - toEdge: The edge of the other view to align to
         - view: The other view to align to
         - xOffset: The x offset
         - yOffset: The y offset
     */
    func align(to toEdge:ViewEdge, outside view:UIView, xOffset:CGFloat = 0, yOffset:CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch toEdge {
            
        case .top:
            self.bottomAnchor.constraint(equalTo: view.topAnchor, constant: yOffset).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            
        case .bottom:
            self.topAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffset).isActive = true
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            
        case .leading:
            self.trailingAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        case .trailing:
            self.leadingAnchor.constraint(equalTo: view.trailingAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        default:
            print("WARNING: Cannot align this view outside the center of secondary view")
        }
    }
    
    /**
     Aligns this view's center to the given edge on the second view and also centers it along that edge.
     
     - parameters:
         - toEdge: The edge of the other view to align to
         - view: The other view to align to
         - xOffset: The x offset
         - yOffset: The y offset
     */
    func alignCenter(to toEdge:ViewEdge, of view:UIView, xOffset:CGFloat = 0, yOffset:CGFloat = 0) {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch toEdge {
            
        case .top:
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.topAnchor, constant: yOffset).isActive = true
            
        case .bottom:
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.bottomAnchor, constant: yOffset).isActive = true
            
        case .leading:
            self.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        case .trailing:
            self.centerXAnchor.constraint(equalTo: view.trailingAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        case .center:
            self.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: xOffset).isActive = true
            self.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: yOffset).isActive = true
            
        }
        
        
    }
}

