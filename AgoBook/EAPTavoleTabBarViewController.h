//
//  EAPTavoleTabBarViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 25/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPTavolePuntiCommonViewController.h"

@class EAPTavoleTabBarViewController;
@class AcuPoint;

@protocol EAPTavoleTabBarViewControllerDelegate <NSObject>

- (void) selectedAcupoint:(AcuPoint *)acupoint fromController:(EAPTavoleTabBarViewController *)controller;

@end

@interface EAPTavoleTabBarViewController : UITabBarController <EAPTavolePuntiDelegate>

@property (strong, nonatomic) id<EAPTavoleTabBarViewControllerDelegate> delegateVC;

@property (strong, nonatomic) Punto *punto;

@end
