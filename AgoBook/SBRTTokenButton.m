//
//  SBRTTokenButton.m
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "SBRTTokenButton.h"
#import "SegnoTag.h"

@implementation SBRTTokenButton


+ (instancetype)buttonWithTag:(SegnoTag *)tag {
    return [[self alloc] initWithTag:tag];
}

- (id)initWithTag:(SegnoTag *) tag {
    self.tag = tag;
    return [self init];
}

-(id)init {
    CGSize sizeOfText = [self.tag.descrizione sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.f]}];
    
    //self = [super initWithFrame:CGRectMake(0, 0, sizeOfText.width, sizeOfText.height)];
    self = [super initWithFrame:CGRectMake(0, 0, sizeOfText.width + 18.104, sizeOfText.height + 10.298)];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0.902 alpha:1.0];
        
        self.layer.cornerRadius = 15.0f;
        self.layer.borderWidth = 1.0f;
        self.layer.borderColor = [UIColor colorWithWhite:0.8 alpha:1.0].CGColor;
        
        [self setTitle:self.tag.descrizione forState:UIControlStateNormal];
        [self setTitleColor:[UIColor colorWithWhite:0.500 alpha:1.0] forState:UIControlStateNormal];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:14.f];
        self.titleLabel.textColor = [UIColor colorWithWhite:0.500 alpha:1.0];
    }
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMeOut:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self addGestureRecognizer:swipe];
    
    return self;
}
/*
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
 
    
    CGSize sizeOfText = [self.tag.descrizione sizeWithAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:14.f]}];
    
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeMeOut:)];
    swipe.direction = UISwipeGestureRecognizerDirectionLeft;
    
    [self addGestureRecognizer:swipe];
}
*/
-(void) swipeMeOut:(UISwipeGestureRecognizer *)swipe {
    [[self.tag managedObjectContext] deleteObject:self.tag];
}

@end