//
//  CoreDataImporter.h
//  AgoBook
//
//  Created by Simone Bierti on 23/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface CoreDataImporter : NSObject

@property (nonatomic, retain) NSDictionary *entitiesWithUniqueAttributes;


+ (void)saveContext:(NSManagedObjectContext*)context;
- (CoreDataImporter*)initWithUniqueAttributes:(NSDictionary*)uniqueAttributes;
- (NSString*)uniqueAttributeForEntity:(NSString*)entity;
- (NSManagedObject*) insertUniqueObjectInTargetEntity:(NSString*)entity
                                 uniqueAttributeValue:(NSString*)uniqueAttributeValue
                                      attributeValues:(NSDictionary*)attributeValues
                                            inContext:(NSManagedObjectContext*)context;
- (NSManagedObject*) insertBasicObjectInTargetEntity:(NSString*)entity
                               targetEntityAttribute:(NSString*)targetEntityAttribute
                                  sourceXMLAttribute:(NSString*)sourceXMLAttribute
                                       attributeDict:(NSDictionary*)attributeDict
                                             context:(NSManagedObjectContext*)context;

@end
