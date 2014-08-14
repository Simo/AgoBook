//
//  EAPPatientsTableViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 10/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataTableViewController.h"

@class EAPPatientsTableViewController;
@class Persona;

@protocol EAPPatientsTableViewControllerDelegate <NSObject>

-(void) openPersonaDiary:(Persona *)persona fromController:(EAPPatientsTableViewController *)controller;

@end

@interface EAPPatientsTableViewController : CoreDataTableViewController <UISearchBarDelegate,UISearchDisplayDelegate>

@property (weak, nonatomic) id<EAPPatientsTableViewControllerDelegate> behaviorDelegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic, retain) NSMutableArray *searchResults;

@end
