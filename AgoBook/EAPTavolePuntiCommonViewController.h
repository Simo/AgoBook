//
//  EAPTavolePuntiCommonViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 24/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPTavolePuntiCommonViewController;
@class Persona;
@class AcuPoint;
@class Punto;

@protocol EAPTavolePuntiDelegate <NSObject>

- (void) selezionatoAcupoint:(AcuPoint *)acupoint perPunto:(Punto *)punto fromController:(EAPTavolePuntiCommonViewController *)controller;

@end

@interface EAPTavolePuntiCommonViewController : UIViewController

@property (weak, nonatomic) IBOutlet id<EAPTavolePuntiDelegate> delegate;

@property (strong, nonatomic) Persona *persona;
@property (strong, nonatomic) Punto *punto;
@property (strong, nonatomic) NSArray *acupoints;

@property (strong, nonatomic) NSArray *meridianPoints;
@property (strong, nonatomic) NSArray *meridianButtons;

@property (strong, nonatomic) NSString *meridian;
@property (strong, nonatomic) NSString *titoloNavBar;

- (NSArray *) getPointsForMeridian:(NSString *)meridian;
- (AcuPoint *) getAcupointWithName:(NSString *)name inArray:(NSArray *)array;

- (void) selezionatoPunto:(AcuPoint *)punto fromController:(EAPTavolePuntiCommonViewController *)controller;

- (IBAction)selezionatoAcupoint:(id)sender;

@end
