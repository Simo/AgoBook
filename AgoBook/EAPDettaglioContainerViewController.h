//
//  EAPDettaglioContainerViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPProblemiViewController.h"
#import "EAPSeduteViewController.h"
#import "EAPPuntiViewController.h"

@class EAPDettaglioContainerViewController;

@protocol EAPDettaglioContainerViewControllerDelegate <NSObject>

-(void)apriNuovaSedutaViewController:(EAPDettaglioContainerViewController *)controller;

@end


@interface EAPDettaglioContainerViewController : UIViewController <EAPProblemiViewControllerDelegate>

@property (weak, nonatomic) id<EAPDettaglioContainerViewControllerDelegate> behaviorDelegate;

@property (strong, nonatomic) EAPProblemiViewController *problemiVC;
@property (strong, nonatomic) EAPSeduteViewController *seduteVC;
@property (strong, nonatomic) EAPPuntiViewController *puntiVC;

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) NSMutableDictionary *relativePositions;

@property (strong, nonatomic) NSArray *listaSedutePerSeduteVC;

-(void)caricaChildVC:(NSString *) segueIdentifier;

@end
