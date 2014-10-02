//
//  EAPCoreDataHelper.m
//  AgoBook
//
//  Created by Simone Bierti on 07/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataHelper.h"

#define debug 1

@implementation CoreDataHelper

#pragma mark - FILES
NSString *storeFilename = @"AgoBook.sqlite";

#pragma mark - PATHS
- (NSString *)applicationDocumentsDirectory {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class,NSStringFromSelector(_cmd));
    }
    return [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask,YES) lastObject];
}

- (NSURL *)applicationStoresDirectory {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSURL *storesDirectory = [[NSURL fileURLWithPath:[self applicationDocumentsDirectory]] URLByAppendingPathComponent:@"Stores"];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    if (![fileManager fileExistsAtPath:[storesDirectory path]]) {
        NSError *error = nil;
        if ([fileManager createDirectoryAtURL:storesDirectory withIntermediateDirectories:YES attributes:nil error:&error]) {
            if (debug==1) {
                NSLog(@"Successfully created Stores directory");
            }
        } else {
            NSLog(@"FAILED to create Stores directory: %@", error);
        }
    }
    return storesDirectory;
}

- (NSURL *)storeURL {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    return [[self applicationStoresDirectory] URLByAppendingPathComponent:storeFilename];
}

#pragma mark - SETUP
- (id)init {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    self = [super init];
    
    if (!self) {
        return nil;
    }
    _model = [NSManagedObjectModel mergedModelFromBundles:nil];
    _coordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:_model];
    _context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_context setPersistentStoreCoordinator:_coordinator];
    return self;
}

- (void)loadStore {
    
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    if (_store) {return;} // Don't load store if it's already loaded
    NSError *error = nil;
    
    NSDictionary *options = @{NSSQLitePragmasOption: @{@"journal_mode": @"DELETE"}};
    
    _store = [_coordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:[self storeURL] options:options error:&error];
    
    if (!_store) {
        NSLog(@"Failed to add store. Error: %@", error);
        abort();
    } else {
        if (debug==1) {
            NSLog(@"Successfully added store: %@", _store);
        }
    }
}

- (void) setupCoreData {
    if(debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    [self loadStore];
}

#pragma mark - SAVING
- (void)saveContext {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    if ([_context hasChanges]) {
        NSError *error = nil;
        if ([_context save:&error]) {
            NSLog(@"_context SAVED changes to persistent store");
        } else {
            NSLog(@"Failed to save _context: %@", error);
        }
    } else {
        NSLog(@"SKIPPED _context save, there are no changes!");
    }
}

#pragma mark – UNDERLYING DATA CHANGE NOTIFICATION
- (void)somethingChanged {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    // Send a notification that tells observing interfaces to refresh their data
    [[NSNotificationCenter defaultCenter]
     postNotificationName:@"SomethingChanged" object:nil];
}


#pragma mark - CORE DATA RESET
- (void)resetContext:(NSManagedObjectContext*)moc
{
    [moc performBlockAndWait:^{
        [moc reset];
    }];
}

- (BOOL)reloadStore
{
    BOOL success = NO;
    NSError *error = nil;
    if (![_coordinator removePersistentStore:_store error:&error]) {
        NSLog(@"Unable to remove persistent store : %@", error);
    }
    [self resetContext:_sourceContext];
    [self resetContext:_importContext];
    [self resetContext:_context];
    [self resetContext:_parentContext];
    _store = nil;
    [self setupCoreData];
    [self somethingChanged];
    if (_store) {
        success = YES;
    }
    return success;
}

@end
