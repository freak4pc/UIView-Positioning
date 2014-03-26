//
//  UIView+Positioning.m
//
//  Created by Shai Mishali on 5/22/13.
//  Copyright (c) 2013 Shai Mishali. All rights reserved.
//

#import "UIView+Positioning.h"

#define SCREEN_SCALE                    ([[UIScreen mainScreen] scale])
#define PIXEL_INTEGRAL(pointValue)      (round(pointValue * SCREEN_SCALE) / SCREEN_SCALE)

@implementation UIView (Positioning)
@dynamic x, y, width, height, origin, size;

// Setters
-(void)setX:(CGFloat)x{
    CGRect r        = self.frame;
    r.origin.x      = PIXEL_INTEGRAL(x);
    self.frame      = r;
}

-(void)setY:(CGFloat)y{
    CGRect r        = self.frame;
    r.origin.y      = PIXEL_INTEGRAL(y);
    self.frame      = r;
}

-(void)setWidth:(CGFloat)width{
    CGRect r        = self.frame;
    r.size.width    = PIXEL_INTEGRAL(width);
    self.frame      = r;
}

-(void)setHeight:(CGFloat)height{
    CGRect r        = self.frame;
    r.size.height   = PIXEL_INTEGRAL(height);
    self.frame      = r;
}

-(void)setOrigin:(CGPoint)origin{
    self.x          = origin.x;
    self.y          = origin.y;
}

-(void)setSize:(CGSize)size{
    self.width      = size.width;
    self.height     = size.height;
}

-(void)setRight:(CGFloat)right {
    self.x = right - self.width;
}

-(void)setBottom:(CGFloat)bottom {
    self.y = bottom - self.height;
}

-(void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

-(void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}

// Getters
-(CGFloat)x{
    return self.frame.origin.x;
}

-(CGFloat)y{
    return self.frame.origin.y;
}

-(CGFloat)width{
    return self.frame.size.width;
}

-(CGFloat)height{
    return self.frame.size.height;
}

-(CGPoint)origin{
    return CGPointMake(self.x, self.y);
}

-(CGSize)size{
    return CGSizeMake(self.width, self.height);
}

-(CGFloat)right {
    return self.frame.origin.x + self.frame.size.width;
}

-(CGFloat)bottom {
    return self.frame.origin.y + self.frame.size.height;
}

-(CGFloat)centerX {
    return self.center.x;
}

-(CGFloat)centerY {
    return self.center.y;
}

-(UIView *)lastSubviewOnX{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];

        for(UIView *v in self.subviews)
            if(v.x > outView.x)
                outView = v;

        return outView;
    }

    return nil;
}

-(UIView *)lastSubviewOnY{
    if(self.subviews.count > 0){
        UIView *outView = self.subviews[0];

        for(UIView *v in self.subviews)
            if(v.y > outView.y)
                outView = v;

        return outView;
    }

    return nil;
}

// Methods
-(void)centerToParent{
    if(self.superview){
        switch ([UIApplication sharedApplication].statusBarOrientation){
            case UIInterfaceOrientationLandscapeLeft:
            case UIInterfaceOrientationLandscapeRight:{
                self.x  =   PIXEL_INTEGRAL((self.superview.height / 2.0) - (self.width / 2.0));
                self.y  =   PIXEL_INTEGRAL((self.superview.width / 2.0) - (self.height / 2.0));
                break;
            }
            case UIInterfaceOrientationPortrait:
            case UIInterfaceOrientationPortraitUpsideDown:{
                self.x  =   PIXEL_INTEGRAL((self.superview.width / 2.0) - (self.width / 2.0));
                self.y  =   PIXEL_INTEGRAL((self.superview.height / 2.0) - (self.height / 2.0));
                break;
            }
        }
    }
}

@end

