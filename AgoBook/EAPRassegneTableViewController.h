//
//  EAPRassegneTableViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 18/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataTableViewController.h"

@class EAPRassegneTableViewController;
@class Persona;
@class Rassegna;

@protocol  EAPRassegnaTableViewControllerDelegate

- (void) openRassegna:(Rassegna *)rassegna fromController:(EAPRassegneTableViewController *)controller;

@end

@interface EAPRassegneTableViewController : CoreDataTableViewController

@property (strong, nonatomic) id<EAPRassegnaTableViewControllerDelegate> behaviorDelegate;

@property (strong,nonatomic) Persona *personaScelta;

@end
