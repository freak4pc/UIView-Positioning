//
//  UIView+Positioning.swift
//
//  Created by Shai Mishali on 1/19/15.
//  Copyright (c) 2015 Shai Mishali. All rights reserved.
//

import UIKit

extension UIView{
    // MARK: - Basic Properties
    var x:CGFloat{
        set{ self.frame = CGRectMake(_pixelIntegral(newValue), self.y, self.width, self.height) }
        get{ return self.frame.origin.x }
    }
    
    var y:CGFloat{
        set { self.frame = CGRectMake(self.x, _pixelIntegral(newValue), self.width, self.height) }
        get { return self.frame.origin.y }
    }
    
    var width: CGFloat{
        set { self.frame = CGRectMake(self.x, self.y, _pixelIntegral(newValue), self.height) }
        get { return self.frame.size.width }
    }
    
    var height: CGFloat{
        set { self.frame = CGRectMake(self.x, self.y, self.width, _pixelIntegral(newValue)) }
        get { return self.frame.size.height }
    }
    
    // MARK: - Origin and Size
    var origin: CGPoint{
        set { self.frame = CGRectMake(_pixelIntegral(newValue.x), _pixelIntegral(newValue.y), self.width, self.height) }
        get { return self.frame.origin }
    }
    
    var size: CGSize{
        set { self.frame = CGRectMake(self.x, self.y, _pixelIntegral(newValue.width), _pixelIntegral(newValue.height)) }
        get { return self.frame.size }
    }
    
    // MARK: - Extra Properties
    var right: CGFloat{
        set { self.x = newValue - self.width }
        get { return self.x + self.width }
    }
    
    var bottom: CGFloat{
        set { self.y = newValue - self.height }
        get { return self.y + self.height }
    }
    
    var top: CGFloat {
        set { self.y = newValue }
        get { return self.y }
    }
    
    var left: CGFloat {
        set { self.x = newValue }
        get { return self.x }
    }
    
    var centerX: CGFloat{
        set { self.center = CGPointMake(newValue, self.centerY) }
        get { return self.center.x }
    }
    
    var centerY: CGFloat {
        set { self.center = CGPointMake(self.centerX, newValue) }
        get { return self.center.y }
    }
    
    var lastSubviewOnX:UIView?{
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.x > outView.x){ outView = v }
            }
            
            return outView
        }
    }
    
    var lastSubviewOnY:UIView?{
        get {
            var outView:UIView = self.subviews[0] as UIView
            
            for v in self.subviews as [UIView] {
                if(v.y > outView.y){ outView = v }
            }
            
            return outView
        }
    }
    
    // MARK: - Bounds Methods
    var boundsX:CGFloat{
        set{ self.bounds = CGRectMake(_pixelIntegral(newValue), self.boundsY, self.boundsWidth, self.boundsHeight) }
        get{ return self.bounds.origin.x }
    }
    
    var boundsY:CGFloat{
        set { self.frame = CGRectMake(self.boundsX, _pixelIntegral(newValue), self.boundsWidth, self.boundsHeight) }
        get { return self.bounds.origin.y }
    }
    
    var boundsWidth: CGFloat{
        set { self.frame = CGRectMake(self.boundsX, self.boundsY, _pixelIntegral(newValue), self.boundsHeight) }
        get { return self.bounds.size.width }
    }
    
    var boundsHeight: CGFloat{
        set { self.frame = CGRectMake(self.boundsX, self.boundsY, self.boundsWidth, _pixelIntegral(newValue)) }
        get { return self.bounds.size.height }
    }
    
    // MARK: - Useful Methods
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