//
//  UIView+Positioning.swift
//
//  Created by Shai Mishali on 1/19/15.
//  Copyright (c) 2015 Shai Mishali. All rights reserved.
//

import UIKit

extension UIView {
    // MARK: - Basic Properties
    
    /// X Axis value of UIView.
    var x: CGFloat {
        set { self.frame = CGRectMake(_pixelIntegral(newValue), self.y, self.width, self.height) }
        get { return self.frame.origin.x }
    }
    
    /// Y Axis value of UIView.
    var y: CGFloat {
        set { self.frame = CGRectMake(self.x, _pixelIntegral(newValue), self.width, self.height) }
        get { return self.frame.origin.y }
    }
    
    /// Width of view.
    var width: CGFloat {
        set { self.frame = CGRectMake(self.x, self.y, _pixelIntegral(newValue), self.height) }
        get { return self.frame.size.width }
    }
    
    /// Height of view.
    var height: CGFloat {
        set { self.frame = CGRectMake(self.x, self.y, self.width, _pixelIntegral(newValue)) }
        get { return self.frame.size.height }
    }
    
    // MARK: - Origin and Size
    
    /// View's origin point.
    var origin: CGPoint {
        set { self.frame = CGRectMake(_pixelIntegral(newValue.x), _pixelIntegral(newValue.y), self.width, self.height) }
        get { return self.frame.origin }
    }
    
    /// View's size.
    var size: CGSize {
        set { self.frame = CGRectMake(self.x, self.y, _pixelIntegral(newValue.width), _pixelIntegral(newValue.height)) }
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
        set { self.center = CGPointMake(newValue, self.centerY) }
        get { return self.center.x }
    }
    
    /// View's center Y value (center.y).
    var centerY: CGFloat {
        set { self.center = CGPointMake(self.centerX, newValue) }
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
        set{ self.bounds = CGRectMake(_pixelIntegral(newValue), self.boundsY, self.boundsWidth, self.boundsHeight) }
        get{ return self.bounds.origin.x }
    }
    
    /// Y value of bounds (bounds.origin.y).
    var boundsY:CGFloat {
        set { self.frame = CGRectMake(self.boundsX, _pixelIntegral(newValue), self.boundsWidth, self.boundsHeight) }
        get { return self.bounds.origin.y }
    }
    
    /// Width of bounds (bounds.size.width).
    var boundsWidth: CGFloat {
        set { self.frame = CGRectMake(self.boundsX, self.boundsY, _pixelIntegral(newValue), self.boundsHeight) }
        get { return self.bounds.size.width }
    }
    
    /// Height of bounds (bounds.size.height).
    var boundsHeight: CGFloat {
        set { self.frame = CGRectMake(self.boundsX, self.boundsY, self.boundsWidth, _pixelIntegral(newValue)) }
        get { return self.bounds.size.height }
    }
    
    // MARK: - Useful Methods
    
    /// Center view to it's parent view.
    func centerToParent(){
        if(self.superview != nil){
            switch(UIApplication.sharedApplication().statusBarOrientation){
                case .LandscapeLeft:
                    fallthrough
                case .LandscapeRight:
                    self.origin = CGPointMake((self.superview!.height / 2) - (self.width / 2),
                                              (self.superview!.width / 2) - (self.height / 2))
                case .Portrait:
                    fallthrough
                case .PortraitUpsideDown:
                    self.origin = CGPointMake((self.superview!.width / 2) - (self.width / 2),
                                              (self.superview!.height / 2) - (self.height / 2))
                case .Unknown:
                    return
            }
        }
    }
    
    // MARK: - Private Methods
    private func _pixelIntegral(pointValue:CGFloat) -> CGFloat{
        let scale   = UIScreen.mainScreen().scale
        return (round(pointValue * scale) / scale)
    }
}
