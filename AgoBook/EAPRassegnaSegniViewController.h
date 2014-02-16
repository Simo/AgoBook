//
//  EAPRassegnaSegniViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPRassegnaSegniViewController;

@protocol EAPRassegnaSegniViewControllerDelegate <NSObject>

-(void) populateRassegnaSegniFields:(EAPRassegnaSegniViewController *) controller;
-(void) changeRassegnaSegniFields:(EAPRassegnaSegniViewController *) controller;

@end

@interface EAPRassegnaSegniViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id<EAPRassegnaSegniViewControllerDelegate> delegate;

@end
