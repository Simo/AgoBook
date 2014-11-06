//
//  EAPAppDelegate.h
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Dropbox/Dropbox.h>
#import "CoreDataHelper.h"

@interface EAPAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) CoreDataHelper *coreDataHelper;


/*
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;
 */
@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;


// - (void)saveContext;
//- (NSURL *)applicationDocumentsDirectory;
-(CoreDataHelper *) cdh;
-(NSArray *) acupoints;

@end
