//
//  SBRTTokenButton.h
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SegnoTag;

@interface SBRTTokenButton : UIButton

@property (weak, nonatomic) SegnoTag *tag;

+ (instancetype)buttonWithTag:(SegnoTag *)tag;

@end
