//
//  EAPAcuPointReference.m
//  AgoBook
//
//  Created by Simone Bierti on 01/11/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPAcuPointReference.h"

@implementation EAPAcuPointReference

- (id) initWithLabel:(NSString *)label andRect:(CGRect)rect
{
    self = [super init];
    
    if(self){
        _labelText = label;
        _designRect = rect;
    }
    
    return self;
}

@end
