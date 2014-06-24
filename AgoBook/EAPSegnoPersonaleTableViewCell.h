//
//  EAPSegnoPersonaleTableViewCell.h
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBRTTokenView.h"

@class Segno;

@interface EAPSegnoPersonaleTableViewCell : UITableViewCell <UITextFieldDelegate,SBRTTokenViewDelegate>

@property (strong, nonatomic) IBOutlet UILabel *lblNomeSegno;
@property (strong, nonatomic) IBOutlet UILabel *lblElementoSegno;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldSegniTag;
@property (strong, nonatomic) SBRTTokenView *tokenView;
@property (strong, nonatomic) IBOutlet UIView *tokensContainerView;
@property (strong, nonatomic) NSMutableArray *tokens;
@property CGFloat tokensContainerViewHeight;
@property CGFloat tokensContainerViewWidth;

-(void) setForTokensContainerView:(UIView *)tokensContainerView height:(CGFloat)height width:(CGFloat)width;
@end
