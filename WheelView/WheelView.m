//
//  WheelView.m
//  WheelView
//
//  Created by Halid Ozsoy on 9/24/12.
//  Copyright (c) 2012 Halid Ozsoy. All rights reserved.
//

#import "WheelView.h"

#define PI 3.141593

@implementation WheelView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code

        currentRotation = 0;
        
        wheelCenter = [self center];
        
        firstTouch = YES;
    }
    return self;
}

-(void)turnWheel:(CGPoint)point1 last:(CGPoint)point2{
    
    CGPoint V1 = CGPointMake(point1.x - wheelCenter.x, -1 * (point1.y - wheelCenter.y));
    CGPoint V2 = CGPointMake(point2.x - wheelCenter.x, -1 * (point2.y - wheelCenter.y));

    CGPoint origin = CGPointMake(0, 0);
    
    CGFloat rad1 = angleBetweenLinesInRadians2(V1, origin);
    CGFloat rad2 = angleBetweenLinesInRadians2(V2, origin);
    
    currentRotation += (rad1 - rad2);
    
    self.transform = CGAffineTransformMakeRotation(-1 * currentRotation);
}

inline CGFloat angleBetweenLinesInRadians2(CGPoint line1End, CGPoint line1Start) {
    
    CGFloat dx = 0, dy = 0;
    
    dx = line1End.x - line1Start.x;
    dy = line1End.y - line1Start.y;
    
    CGFloat rads = atan2f(dy, dx);
    
    return rads < 0 ? rads + (2 * PI) : rads;
}

#pragma mark - Touch Handlers

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    UITouch* touch = [[touches allObjects] objectAtIndex:0];
    lastTouchLocation = [touch locationInView:[self superview]];
    
    firstTouch = YES;
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    
    lastTouchLocation = currentTouchLocation;
    
    UITouch* touch = [[touches allObjects] objectAtIndex:0];
    currentTouchLocation = [touch locationInView:[self superview]];

    if (!firstTouch) {
        [self turnWheel:currentTouchLocation last:lastTouchLocation];
    }
    
    firstTouch = NO;
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    
    lastTouchLocation = currentTouchLocation;
    
    UITouch* touch = [[touches allObjects] objectAtIndex:0];
    currentTouchLocation = [touch locationInView:[self superview]];
    
    if (!firstTouch) {
        [self turnWheel:currentTouchLocation last:lastTouchLocation];
    }
    
    currentTouchLocation = lastTouchLocation;
}

@end