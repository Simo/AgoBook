//
//  EAPCoreDataHelper.h
//  AgoBook
//
//  Created by Simone Bierti on 07/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelper : NSObject

@property (nonatomic, readonly) NSManagedObjectModel *model;
@property (nonatomic, readonly) NSManagedObjectContext *context;
@property (nonatomic, readonly) NSPersistentStoreCoordinator *coordinator;
@property (nonatomic, readonly) NSPersistentStore *store;

-(void) setupCoreData;
-(void) saveContext;

@end
