//
//  SBRTTokenView.m
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "SBRTTokenView.h"
#import "SBRTTokenButton.h"

@implementation SBRTTokenView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

-(SBRTTokenButton *) createTokenButtonForString:(NSString *)string {
    SBRTTokenButton *btn = [[SBRTTokenButton alloc] init];
    [btn setTitle:string forState:UIControlStateNormal];
    CGSize size = [string sizeWithAttributes:@{NSFontAttributeName:btn.titleLabel.font}];
    CGFloat border = (self.nextToken.x + size.width + 20.0);
    if(border > self.frame.size.width) {
        [self setNextToken:CGPointMake(0.0, self.nextToken.y+50)];
        self.linesHeight = self.linesHeight +50;
    }
    btn.frame = CGRectMake(self.nextToken.x, self.nextToken.y, size.width +20.0, 44);
    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 10);
    [self setNextToken:CGPointMake(self.nextToken.x +size.width + 20.0, self.nextToken.y)];
    return btn;
}


- (void) refreshTokenView:(NSArray *) array {
    
    [self.delegate addMeToSubviews:self];
    
    self.nextToken = CGPointZero;
    self.linesHeight = 50.0;
    
    for (NSString *string in array) {
        SBRTTokenButton *btn = [self createTokenButtonForString:string];
        [btn setNeedsDisplay];
        [self addSubview:btn];
    }
    
    
}


@end
