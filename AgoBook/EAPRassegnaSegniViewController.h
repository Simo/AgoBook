//
//  EAPRassegnaSegniViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBRTTokenView.h"

@class EAPRassegnaSegniViewController;

@protocol EAPRassegnaSegniViewControllerDelegate <NSObject>

-(void) populateRassegnaSegniFields:(EAPRassegnaSegniViewController *) controller;
-(void) changeRassegnaSegniFields:(EAPRassegnaSegniViewController *) controller;

@end

@interface EAPRassegnaSegniViewController : UIViewController <UITextFieldDelegate, SBRTTokenViewDelegate>

@property (weak, nonatomic) id<EAPRassegnaSegniViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldTokenize;
@property (strong, nonatomic) IBOutlet UIView *segni1;
@property (strong, nonatomic) SBRTTokenView *view2;
@property (strong, nonatomic) SBRTTokenView *view3;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldTokenize3;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@end
