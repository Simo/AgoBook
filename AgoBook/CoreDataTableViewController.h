//
//  CoreDataTableViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 08/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CoreDataTableViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;

-(void)performFetch;

@end
