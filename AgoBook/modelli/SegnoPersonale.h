//
//  SegnoPersonale.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona, Rassegna, Segno;

@interface SegnoPersonale : NSManagedObject

@property (nonatomic, retain) NSDate * dataIns;
@property (nonatomic, retain) Persona *persona;
@property (nonatomic, retain) Segno *segno;
@property (nonatomic, retain) NSSet *tags;
@end

@interface SegnoPersonale (CoreDataGeneratedAccessors)

- (void)addTagsObject:(Rassegna *)value;
- (void)removeTagsObject:(Rassegna *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
