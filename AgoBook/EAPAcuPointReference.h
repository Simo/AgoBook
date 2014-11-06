//
//  EAPAcuPointReference.h
//  AgoBook
//
//  Created by Simone Bierti on 01/11/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EAPAcuPointReference : NSObject

@property (strong, nonatomic) NSString *labelText;
@property (assign) CGRect designRect;

- (id) initWithLabel:(NSString *)label andRect:(CGRect)rect;

@end
