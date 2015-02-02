//
//  EAPSeduteViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"
#import "Trattamento.h"

@interface EAPSeduteViewController : CoreDataTableViewController <UIActionSheetDelegate>

@property (weak, nonatomic) Trattamento *trattamento;
@property (strong, nonatomic) NSArray *listaSedute;

@end
