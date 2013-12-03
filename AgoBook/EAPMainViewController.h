//
//  EAPMainViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPFlipsideViewController.h"

@interface EAPMainViewController : UIViewController <EAPFlipsideViewControllerDelegate, UIPopoverControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@end
