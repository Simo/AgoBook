//
//  EAPPopOverRassegneViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 17/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPRassegneTableViewController.h"

@class EAPPopOverRassegneViewController;
@class Persona;

@protocol EAPPopOverRassegneViewControllerDelegate <NSObject>

- (void) openRassegna:(Rassegna *)rassegna fromController:(EAPPopOverRassegneViewController *)controller;

@end

@interface EAPPopOverRassegneViewController : UIViewController <EAPRassegnaTableViewControllerDelegate>

@property (strong, nonatomic) id<EAPPopOverRassegneViewControllerDelegate> behaviorDelegate;

@property (strong, nonatomic) Persona *personaScelta;

@property (strong, nonatomic) EAPRassegneTableViewController *rassegneController;

@end
