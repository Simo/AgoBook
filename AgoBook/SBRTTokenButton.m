//
//  SBRTTokenButton.m
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "SBRTTokenButton.h"

@implementation SBRTTokenButton

-(void)drawRect:(CGRect)rect {
    
    //// Color Declarations
    UIColor* selectedTextBackgroundColor = [UIColor colorWithRed: 0.655 green: 0.793 blue: 0.999 alpha: 1];
    //// Frames
    CGRect tokenButtonFrame = rect;
    //// Group
    {
        //// Rounded Rectangle Drawing
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect: CGRectMake(CGRectGetMinX(tokenButtonFrame) + 3, CGRectGetMinY(tokenButtonFrame) + 3, CGRectGetWidth(tokenButtonFrame) - 5, floor((CGRectGetHeight(tokenButtonFrame) - 3) * 0.91111 + 0.5)) cornerRadius: 20];
        [selectedTextBackgroundColor setFill];
        [roundedRectanglePath fill];
        [[UIColor lightTextColor] setStroke];
        roundedRectanglePath.lineWidth = 1;
        [roundedRectanglePath stroke];
    }
}
@end
