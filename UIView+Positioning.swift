//
//  UIView+Positioning.swift
//
//  Created by Shai Mishali on 1/19/15.
//  Copyright (c) 2015 Shai Mishali. All rights reserved.
//  Updated to Swift 3.0 by Muhammad Assar <abu.assar@gmail.com> on 12/1/2016

import UIKit

extension UIView {
    // MARK: - Basic Properties
    
    /// X Axis value of UIView.
    var x: CGFloat {
        set { self.frame = CGRect(x: newValue,y: self.y,width: self.width,height: self.height) }
        get { return self.frame.origin.x }
    }
    
    /// Y Axis value of UIView.
    var y: CGFloat {
        set { self.frame = CGRect(x: self.x,y: newValue,width: self.width,height: self.height) }
        get { return self.frame.origin.y }
    }
    
    /// Width of view.
    var width: CGFloat {
        set { self.frame = CGRect(x: self.x,y: self.y,width: newValue,height: self.height) }
        get { return self.frame.size.width }
    }
    
    /// Height of view.
    var height: CGFloat {
        set { self.frame = CGRect(x: self.x,y: self.y,width: self.width,height: newValue) }
        get { return self.frame.size.height }
    }
    
    // MARK: - Origin and Size
    
    /// View's origin point.
    var origin: CGPoint {
        set { self.frame = CGRect(x: newValue.x,y: newValue.y,width: self.width,height: self.height) }
        get { return self.frame.origin }
    }
    
    /// View's size.
    var size: CGSize {
        set { self.frame = CGRect(x: self.x,y: self.y,width: newValue.width,height: newValue.height) }
        get { return self.frame.size }
    }
    
    // MARK: - Extra Properties
    
    /// View's right side (x + width).
    var right: CGFloat {
        set { self.x = newValue - self.width }
        get { return self.x + self.width }
    }
    
    /// View's bottom (y + height).
    var bottom: CGFloat {
        set { self.y = newValue - self.height }
        get { return self.y + self.height }
    }
    
    /// View's top (y).
    var top: CGFloat {
        set { self.y = newValue }
        get { return self.y }
    }
    
    /// View's left side (x).
    var left: CGFloat {
        set { self.x = newValue }
        get { return self.x }
    }
    
    /// View's center X value (center.x).
    var centerX: CGFloat {
        set { self.center = CGPoint(x: newValue, y: self.centerY) }
        get { return self.center.x }
    }
    
    /// View's center Y value (center.y).
    var centerY: CGFloat {
        set { self.center = CGPoint(x: self.centerX, y: newValue) }
        get { return self.center.y }
    }
    
    /// Last subview on X Axis.
    var lastSubviewOnX:UIView? {
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.x > outView.x){ outView = v }
            }
            
            return outView
        }
    }
    
    /// Last subview on Y Axis.
    var lastSubviewOnY:UIView? {
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.y > outView.y){ outView = v }
            }
            
            return outView
        }
    }
    
    // MARK: - Bounds Methods
    
    /// X value of bounds (bounds.origin.x).
    var boundsX:CGFloat {
        set{ self.bounds = CGRect(x: newValue, y: self.boundsY, width: self.boundsWidth, height: self.boundsHeight) }
        get{ return self.bounds.origin.x }
    }
    
    /// Y value of bounds (bounds.origin.y).
    var boundsY:CGFloat {
        set { self.frame = CGRect(x: self.boundsX, y: newValue, width: self.boundsWidth, height: self.boundsHeight) }
        get { return self.bounds.origin.y }
    }
    
    /// Width of bounds (bounds.size.width).
    var boundsWidth: CGFloat {
        set { self.frame = CGRect(x: self.boundsX, y: self.boundsY, width: newValue, height: self.boundsHeight) }
        get { return self.bounds.size.width }
    }
    
    /// Height of bounds (bounds.size.height).
    var boundsHeight: CGFloat {
        set { self.frame = CGRect(x: self.boundsX, y: self.boundsY, width: self.boundsWidth, height: newValue) }
        get { return self.bounds.size.height }
    }
    
    // MARK: - Useful Methods
    
    /// Center view to it's parent view.
    func centerToParent(){
        if(self.superview != nil){
            switch(UIApplication.shared.statusBarOrientation){
                case .landscapeLeft:
                    fallthrough
                case .landscapeRight:
                    self.origin = CGPoint(x: (self.superview!.height / 2) - (self.width / 2),
                                          y: (self.superview!.width / 2) - (self.height / 2))
                case .portrait:
                    fallthrough
                case .portraitUpsideDown:
                    self.origin = CGPoint(x: (self.superview!.width / 2) - (self.width / 2),
                                          y: (self.superview!.height / 2) - (self.height / 2))
                case .unknown:
                    return
            }
        }
    }
    
    // MARK: - Private Methods
    private func _pixelIntegral(pointValue:CGFloat) -> CGFloat{
        let scale   = UIScreen.main.scale
        return (round(pointValue * scale) / scale)
    }
}
