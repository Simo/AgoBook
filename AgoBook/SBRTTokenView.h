//
//  SBRTTokenView.h
//  AgoBook
//
//  Created by Simone Bierti on 15/04/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SBRTTokenView;

@protocol SBRTTokenViewDelegate <NSObject>

-(void)addMeToSubviews:(SBRTTokenView *) view;

@end

@interface SBRTTokenView : UIView

@property CGPoint nextToken;
@property CGFloat linesHeight;
@property (weak, nonatomic) id <SBRTTokenViewDelegate> delegate;


+ (CGFloat) heightForTokenViewFromArray:(NSArray *) strings withFont:(UIFont *)font withViewWidth:(CGFloat) width;
- (void) refreshTokenView:(NSArray *) array;
- (void) refreshTokenViewWithSegnoTags:(NSArray *) array;
- (void) refreshTokenView:(NSArray *) array forCell:(NSInteger) indexPathRow;
@end
