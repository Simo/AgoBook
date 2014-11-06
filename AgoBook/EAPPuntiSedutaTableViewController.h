//
//  EAPPuntiSedutaTableViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 15/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "DEMONavigationController.h"

@interface EAPPuntiSedutaTableViewController : CoreDataTableViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate, AcuPointTableNavigationDelegate>

-(void)populateList;

@end
