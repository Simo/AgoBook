//
//  EAPNuovaSedutaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 08/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
@class EAPPuntiSedutaTableViewController, Seduta;

@interface EAPNuovaSedutaViewController : UIViewController

@property (strong, nonatomic) EAPPuntiSedutaTableViewController *puntiList;
@property (weak, nonatomic) Seduta *seduta;

@end