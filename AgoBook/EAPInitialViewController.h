//
//  EAPInitialViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPPatientsTableViewController.h"

@class Persona;

@interface EAPInitialViewController : UIViewController <EAPPatientsTableViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) Persona *personaScelta;
@property (strong, nonatomic) EAPPatientsTableViewController *popOverList;
@property (strong, nonatomic) UIPopoverController *popOver;

@end
