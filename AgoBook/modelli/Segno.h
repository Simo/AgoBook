//
//  Segno.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Elemento, SegnoPersonale;

@interface Segno : NSManagedObject

@property (nonatomic, retain) NSNumber * attivo;
@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSNumber * priority;
@property (nonatomic, retain) NSSet *elementi;
@property (nonatomic, retain) NSSet *segnipersonali;
@end

@interface Segno (CoreDataGeneratedAccessors)

- (void)addElementiObject:(Elemento *)value;
- (void)removeElementiObject:(Elemento *)value;
- (void)addElementi:(NSSet *)values;
- (void)removeElementi:(NSSet *)values;

- (void)addSegnipersonaliObject:(SegnoPersonale *)value;
- (void)removeSegnipersonaliObject:(SegnoPersonale *)value;
- (void)addSegnipersonali:(NSSet *)values;
- (void)removeSegnipersonali:(NSSet *)values;

@end
