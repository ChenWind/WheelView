//
//  WheelView.h
//  WheelView
//
//  Created by Halid Ozsoy on 9/24/12.
//  Copyright (c) 2012 Halid Ozsoy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WheelView : UIView {
    
    CGPoint currentTouchLocation;
    CGPoint lastTouchLocation;
    
    CGPoint wheelCenter;
    
    double currentRotation;
    
    BOOL firstTouch;
}

-(void)turnWheel:(CGPoint)point1 last:(CGPoint)point2;

CGFloat angleBetweenLinesInRadians2(CGPoint line1Start, CGPoint line1End);

@end
