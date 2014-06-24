//
//  EAPRassSegniPersonaleViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataTableViewController.h"

@class EAPRassSegniPersonaleViewController;

@protocol EAPRassSegniPersonaleViewControllerDelegate <NSObject>

-(void) populateRassegnaSegniFields:(EAPRassSegniPersonaleViewController *) controller;
-(void) changeRassegnaSegniFields:(EAPRassSegniPersonaleViewController *) controller;

@end

@interface EAPRassSegniPersonaleViewController : CoreDataTableViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>

@property (weak,nonatomic) id<EAPRassSegniPersonaleViewControllerDelegate> delegate;
@end
