//
//  EAPCoreDataHelper.m
//  AgoBook
//
//  Created by Simone Bierti on 07/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataHelper.h"
#import "CoreDataImporter.h"

#define debug 1

@implementation CoreDataHelper

#pragma mark - FILES
NSString *storeFilename = @"AgoBook.sqlite";

#pragma mark - PATHS
- (NSString *)applicationDocumentsDirectory {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class,NSStringFromSelector(_cmd));
        NSLog(@"Il file sqlite: %@",[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory  inDomains:NSUserDomainMask] lastObject]);
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
    
    _importContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSPrivateQueueConcurrencyType];
    [_importContext performBlockAndWait:^{
        [_importContext setPersistentStoreCoordinator:_coordinator];
        [_importContext setUndoManager:nil]; // the default on iOS
    }];
    
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
    [self checkIfDefaultDataNeedsImporting];
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

#pragma mark - DATA IMPORT

- (BOOL)isDefaultDataAlreadyImportedForStoreWithURL:(NSURL*)url
                                             ofType:(NSString*)type {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSError *error;
    NSDictionary *dictionary =
    [NSPersistentStoreCoordinator metadataForPersistentStoreOfType:type
                                                               URL:url error:&error];
    if (error) {
        NSLog(@"Error reading persistent store metadata: %@", error.localizedDescription);
    }
    else {
        NSNumber *defaultDataAlreadyImported = [dictionary valueForKey:@"DefaultDataImported"];
        if (![defaultDataAlreadyImported boolValue]) {
            NSLog(@"Default Data has NOT already been imported");
            return NO;
        }
    }
    if (debug==1) {
        NSLog(@"Default Data HAS already been imported");
    }
    return YES;
}

- (void)checkIfDefaultDataNeedsImporting { if (debug==1) {
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    if (![self isDefaultDataAlreadyImportedForStoreWithURL:[self storeURL] ofType:NSSQLiteStoreType]) {
        self.importAlertView =
        [[UIAlertView alloc] initWithTitle:@"Import Default Data?"
                                   message:
         @"If you've never used Grocery Dude before then some default data might help you understand how to use it. Tap 'Import' to import default data. Tap 'Cancel' to skip the import, especially if you've done this before on other devices."
                                  delegate:self
                         cancelButtonTitle:@"Cancel"
                         otherButtonTitles:@"Import", nil];
         [self.importAlertView show];
    }
}

- (void)importFromXML:(NSURL*)url {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    self.parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
    self.parser.delegate = self;
    NSLog(@"**** START PARSE OF %@", url.path);
    [self.parser parse];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"SomethingChanged" object:nil];
    NSLog(@"***** END PARSE OF %@", url.path);
}

- (void)setDefaultDataAsImportedForStore:(NSPersistentStore*)aStore {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    // get metadata dictionary
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:[[aStore metadata] copy]];
    if (debug==1) {
        NSLog(@"__Store Metadata BEFORE changes__ \n %@", dictionary);
    }
    // edit metadata dictionary
    [dictionary setObject:@YES forKey:@"DefaultDataImported"];
    // set metadata dictionary
    [self.coordinator setMetadata:dictionary forPersistentStore:aStore];
    if (debug==1){
        NSLog(@"__Store Metadata AFTER changes__ \n %@", dictionary);
    }
}

#pragma mark - DELEGATE: UIAlertView
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex { if (debug==1) {
    NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd)); }
    if (alertView == self.importAlertView) {
        if (buttonIndex == 1) { // The 'Import' button on the importAlertView
            NSLog(@"Default Data Import Approved by User"); [_importContext performBlock:^{
                // XML Import
                [self importFromXML:[[NSBundle mainBundle]
                                     URLForResource:@"DefaultData" withExtension:@"xml"]];
            }]; } else {
                NSLog(@"Default Data Import Cancelled by User"); }
        // Set the data as imported regardless of the user's decision
        [self setDefaultDataAsImportedForStore:_store]; }
}

#pragma mark - UNIQUE ATTRIBUTE SELECTION (This code is used when instantiating CoreDataImporter)
- (NSDictionary*)selectedUniqueAttributes {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    NSMutableArray *entities = [NSMutableArray new];
    NSMutableArray *attributes = [NSMutableArray new];
    // Select an attribute in each entity for uniqueness
    [entities addObject:@"AcuPoint"];
    [attributes addObject:@"name"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjects:attributes forKeys:entities];
    return dictionary;
}

#pragma mark - DELEGATE: NSXMLParser
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    if (debug==1) {
        NSLog(@"Parser Error: %@", parseError.localizedDescription);
    }
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict {
    [self.importContext performBlockAndWait:^{
    // STEP 1: Process only the 'item' element in the XML file
    if ([elementName isEqualToString:@"point"]) {
    // STEP 2: Prepare the Core Data Importer
    CoreDataImporter *importer = [[CoreDataImporter alloc] initWithUniqueAttributes: [self selectedUniqueAttributes]];
    /*
        // STEP 3a: Insert a unique 'Item' object
        NSManagedObject *item = [importer insertBasicObjectInTargetEntity:@"Item"
                                                    targetEntityAttribute:@"name"
                                                       sourceXMLAttribute:@"name"
                                                            attributeDict:attributeDict
                                                                  context:_importContext];
    // STEP 3b: Insert a unique 'Unit' object
    NSManagedObject *unit = [importer insertBasicObjectInTargetEntity:@"Unit"
                                                targetEntityAttribute:@"name"
                                                   sourceXMLAttribute:@"unit"
                                                        attributeDict:attributeDict
                                                              context:_importContext];
    // STEP 3c: Insert a unique 'LocationAtHome' object
        NSManagedObject *locationAtHome = [importer insertBasicObjectInTargetEntity:@"LocationAtHome"
                                                              targetEntityAttribute:@"storedIn"
                                                                 sourceXMLAttribute:@"locationathome"
                                                                      attributeDict:attributeDict
                                                                            context:_importContext];
    // STEP 3d: Insert a unique 'LocationAtShop' object
        NSManagedObject *locationAtShop = [importer insertBasicObjectInTargetEntity:@"LocationAtShop"
                                                              targetEntityAttribute:@"aisle" sourceXMLAttribute:@"locationatshop"
                                                                      attributeDict:attributeDict
                                                                            context:_importContext];
        // STEP 4: Manually add extra attribute values.
        [item setValue:@NO forKey:@"listed"];
        // STEP 5: Create relationships
        [item setValue:unit forKey:@"unit"];
        [item setValue:locationAtHome forKey:@"locationAtHome"];
        [item setValue:locationAtShop forKey:@"locationAtShop"];
     
     // STEP 6: Save new objects to the persistent store.
     */
    
        NSManagedObject *acupoint = [importer insertBasicObjectInTargetEntity:@"AcuPoint" targetEntityAttribute:@"name" sourceXMLAttribute:@"name" attributeDict:attributeDict context:_importContext];
        [acupoint setValue:[attributeDict valueForKey:@"chinese-name"] forKey:@"chineseName"];
        [acupoint setValue:[attributeDict valueForKey:@"english"] forKey:@"english"];
        [acupoint setValue:[attributeDict valueForKey:@"pinyin"] forKey:@"pinyin"];
        [acupoint setValue:[attributeDict valueForKey:@"han-geul"] forKey:@"hanGeul"];
        [acupoint setValue:[attributeDict valueForKey:@"romaji"] forKey:@"romaji"];
        [acupoint setValue:[attributeDict valueForKey:@"alternative"] forKey:@"alternative"];
        [acupoint setValue:[attributeDict valueForKey:@"meridian"] forKey:@"meridian"];
        NSNumberFormatter * f = [[NSNumberFormatter alloc] init];
        [f setNumberStyle:NSNumberFormatterDecimalStyle];
        [acupoint setValue:[f numberFromString:[attributeDict valueForKey:@"num"]] forKey:@"num"];
        
     [CoreDataImporter saveContext:_importContext];
        // STEP 7: Turn objects into faults to save memory
        [_importContext refreshObject:acupoint mergeChanges:NO];
        //[_importContext refreshObject:unit mergeChanges:NO];
        //[_importContext refreshObject:locationAtHome mergeChanges:NO];
        //[_importContext refreshObject:locationAtShop mergeChanges:NO];
    }
}];
}


@end
