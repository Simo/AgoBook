//
//  EAPCoreDataHelper.h
//  AgoBook
//
//  Created by Simone Bierti on 07/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelper : NSObject

@property (nonatomic, readonly) NSManagedObjectContext       *parentContext;
@property (nonatomic, readonly) NSManagedObjectContext       *context;
@property (nonatomic, readonly) NSManagedObjectContext       *importContext;

@property (nonatomic, readonly) NSManagedObjectModel         *model;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, readonly) NSPersistentStore            *store;

@property (nonatomic, readonly) NSManagedObjectContext       *sourceContext;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *sourceCoordinator;
@property (nonatomic, readonly) NSPersistentStore            *sourceStore;

//@property (nonatomic, retain) MigrationVC *migrationVC;

@property (nonatomic, retain) UIAlertView *importAlertView;


-(void) setupCoreData;
-(void) saveContext;
-(BOOL) reloadStore;
- (NSURL *)applicationStoresDirectory;

@end
