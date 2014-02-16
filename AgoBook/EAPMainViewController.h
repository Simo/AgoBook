//
//  EAPMainViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPFlipsideViewController.h"
#import "EAPSideBarViewController.h"
#import "EAPContentContainerViewController.h"

@class Persona;

@interface EAPMainViewController : UIViewController <EAPFlipsideViewControllerDelegate, UIPopoverControllerDelegate, EAPSideBarViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) Persona *personaScelta;

@property (strong, nonatomic) UIPopoverController *flipsidePopoverController;

@property (strong, nonatomic) IBOutlet UIView *sideBarViewContainer;
@property (strong, nonatomic) EAPSideBarViewController *sideBarChildViewController;
@property (strong, nonatomic) IBOutlet UIView *contentViewContainer;
@property (strong, nonatomic) EAPContentContainerViewController *contentContainer;

@end
