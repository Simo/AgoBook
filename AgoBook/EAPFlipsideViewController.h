//
//  EAPFlipsideViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPFlipsideViewController;

@protocol EAPFlipsideViewControllerDelegate
- (void)flipsideViewControllerDidFinish:(EAPFlipsideViewController *)controller;
@end

@interface EAPFlipsideViewController : UIViewController

@property (weak, nonatomic) id <EAPFlipsideViewControllerDelegate> delegate;

- (IBAction)done:(id)sender;

@end
