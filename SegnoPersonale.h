//
//  SegnoPersonale.h
//  AgoBook
//
//  Created by Simone Bierti on 24/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Rassegna, Segno, SegnoTag;

@interface SegnoPersonale : NSManagedObject

@property (nonatomic, retain) NSDate * dataIns;
@property (nonatomic, retain) Rassegna *rassegna;
@property (nonatomic, retain) Segno *segno;
@property (nonatomic, retain) NSSet *tags;
@end

@interface SegnoPersonale (CoreDataGeneratedAccessors)

- (void)addTagsObject:(SegnoTag *)value;
- (void)removeTagsObject:(SegnoTag *)value;
- (void)addTags:(NSSet *)values;
- (void)removeTags:(NSSet *)values;

@end
