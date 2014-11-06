//
//  DEMOMenuViewController.h
//  REFrostedViewControllerExample
//
//  Created by Roman Efimov on 9/18/13.
//  Copyright (c) 2013 Roman Efimov. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DEMONavigationController.h"
#import "REFrostedViewController.h"

@interface DEMOMenuViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) DEMONavigationController *navigationController;
@property (strong, nonatomic) NSArray *listaVC;
@property (strong, nonatomic) NSArray *listaVociMenu;

@end
