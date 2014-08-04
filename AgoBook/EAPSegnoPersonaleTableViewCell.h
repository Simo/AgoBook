//
//  EAPSegnoPersonaleTableViewCell.h
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBRTTokenView.h"

@class EAPSegnoPersonaleTableViewCell;
@class Segno;
@class SegnoPersonale;
@class SegnoTag;

@protocol EAPSegnoPersonaleTableViewCellDelegate

-(void) reloadDataOnTableView:(EAPSegnoPersonaleTableViewCell *)controller;

@end

@interface EAPSegnoPersonaleTableViewCell : UITableViewCell <UIScrollViewDelegate ,UITextFieldDelegate,SBRTTokenViewDelegate>

@property (weak, nonatomic) id<EAPSegnoPersonaleTableViewCellDelegate> delegate;
@property (strong, nonatomic) SegnoPersonale *segnoPersonale;
@property (strong, nonatomic) UIView *containerTokenView;
@property (strong, nonatomic) SBRTTokenView *tokenView;
@property (strong, nonatomic) NSMutableArray *tokens;


@end
