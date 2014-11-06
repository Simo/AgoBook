//
//  DEMONavigationController.h
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPTavolePuntiCommonViewController.h"

@class DEMONavigationController;
@class AcuPoint;

@protocol AcuPointTableNavigationDelegate

- (void) selectedAcupoint:(AcuPoint *)acupoint fromController:(DEMONavigationController *)controller;

@end


@interface DEMONavigationController : UINavigationController <EAPTavolePuntiDelegate>

@property (weak, nonatomic) id<AcuPointTableNavigationDelegate> delegateVC;

- (void)showMenu;

@end
