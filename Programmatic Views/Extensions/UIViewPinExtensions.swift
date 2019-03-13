//
//  UIViewPinExtensions.swift
//  ProgrammaticViews
//
//  Created by Robert Barber on 3/13/19.
//

import UIKit

// MARK:- Public API
public extension UIView {
    
    /**
     Aligns this view to the specified edge of the secondary view. The secondary view must either be a superview or sibling
     of this view.
     
     - parameters:
     - edge: The edge of the current view to align with
     - to: The edge of the secondary view that this view's "edge" property will be aligned against
     - view: The secondary view to align against
     - constant: The amount of space between the two views for this constraint
     - safeArea: True if the alignment should take any safe area into consideration.
     */
    func pin(_ edge:ViewEdge, to toEdge:ViewEdge, ofView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        switch edge {
            
        case .top:
            self.pinTop(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
            
        case .bottom:
            self.pinBottom(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
            
        case .leading:
            self.pinLeading(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
            
        case .trailing:
            self.pinTrailing(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
            
        case .center:
            if toEdge == .top || toEdge == .bottom {
                self.pinCenterY(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
                
            } else if toEdge == .leading || toEdge == .trailing {
                self.pinCenterX(toEdge: toEdge, onView: view, constant: constant, safeArea: safeArea)
                
            } else {
                // Pinning center to center
                self.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
                self.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
                
            }
            
            
        }
        
    }
    
}

// MARK:- Pinning Vertical edges
extension UIView {
    
    /**
     Pins the top of this view to the top or bottom edge of the given view. Does nothing if the edge is not
     a Y-axis edge (i.e. top/bottom/center)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinTop(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .top:
            let anchor = safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
            self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .bottom:
            let anchor = safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
            self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor
            self.topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.xPinOnYEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
    /**
     Pins the bottom of this view to a vertical of the given view. Does nothing if the edge is not
     a Y-axis edge (i.e. top/bottom/center)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinBottom(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .top:
            let anchor = safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
            self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .bottom:
            let anchor = safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
            self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor
            self.bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.xPinOnYEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
}

// MARK:- Pinning Center
extension UIView {
    
    /**
     Pins the center Y of this view to a vertical of the given view. Does nothing if the edge is not
     a Y-axis edge (i.e. top/bottom/center)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinCenterY(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .top:
            let anchor = safeArea ? view.safeAreaLayoutGuide.topAnchor : view.topAnchor
            self.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .bottom:
            let anchor = safeArea ? view.safeAreaLayoutGuide.bottomAnchor : view.bottomAnchor
            self.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerYAnchor : view.centerYAnchor
            self.centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.xPinOnYEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
    /**
     Pins the center X of this view to a horizontal edge of the given view. Does nothing if the edge is not
     a X-axis edge (i.e. top/bottom/center)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinCenterX(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .leading:
            let anchor = safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
            self.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .trailing:
            let anchor = safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
            self.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor
            self.centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.xPinOnYEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
}

// MARK:- Pinning Horizontal edges
extension UIView {
    
    /**
     Pins the leading of this view to the leading or trailing edge of the given view. Does nothing if the edge is not
     a X-axis edge (i.e. leading/trailing)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinLeading(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .leading:
            let anchor = safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
            self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .trailing:
            let anchor = safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
            self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor
            self.leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.yPinOnXEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
    /**
     Pins the trailing of this view to the leading or trailing edge of the given view. Does nothing if the edge is not
     a X-axis edge (i.e. leading/trailing)
     
     - parameters:
         - edge: The edge to pin this view against
         - view: The view to pin against
         - constant: Amount of space between the two views
         - safeArea: True if any safe area should be taken into consideration
     
     */
    private func pinTrailing(toEdge edge:ViewEdge, onView view:UIView, constant:CGFloat = 0, safeArea:Bool = false) {
        
        switch edge {
        case .leading:
            let anchor = safeArea ? view.safeAreaLayoutGuide.leadingAnchor : view.leadingAnchor
            self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .trailing:
            let anchor = safeArea ? view.safeAreaLayoutGuide.trailingAnchor : view.trailingAnchor
            self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        case .center:
            let anchor = safeArea ? view.safeAreaLayoutGuide.centerXAnchor : view.centerXAnchor
            self.trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
            
        default:
            print(PinWarning.yPinOnXEdge.rawValue)
            return // Do nothing. Leading and trailing constraints don't make sense here
        }
        
    }
    
    
}

