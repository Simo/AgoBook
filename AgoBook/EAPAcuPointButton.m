//
//  EAPAcuPointButton.m
//  AgoBook
//
//  Created by Simone Bierti on 01/11/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPAcuPointButton.h"

@implementation EAPAcuPointButton

- (id)initWithFrame:(CGRect)frame andLabel:(NSString *)label
{
    self = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    if(self){
        self.frame = frame;
        self.titleLabel.text = label;
    }
    
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
