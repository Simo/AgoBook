//
//  EAPInitialViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPMainViewController.h"
#import "EAPPopOverPazientiViewController.h"

@class Persona;

@interface EAPInitialViewController : UIViewController <UIPopoverControllerDelegate, EAPPPopOverPazientiViewControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (weak, nonatomic) Persona *personaScelta;
@property (strong, nonatomic) EAPPopOverPazientiViewController *popOverList;
@property (strong, nonatomic) UIPopoverController *pazientiPopoverController;

@end
