//
//  Rassegna.h
//  AgoBook
//
//  Created by Simone Bierti on 24/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona, SegnoPersonale;

@interface Rassegna : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) Persona *persona;
@property (nonatomic, retain) NSSet *segnipersonali;
@end

@interface Rassegna (CoreDataGeneratedAccessors)

- (void)addSegnipersonaliObject:(SegnoPersonale *)value;
- (void)removeSegnipersonaliObject:(SegnoPersonale *)value;
- (void)addSegnipersonali:(NSSet *)values;
- (void)removeSegnipersonali:(NSSet *)values;

@end
