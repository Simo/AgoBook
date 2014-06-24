//
//  Diagnosi.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Seduta, Trattamento;

@interface Diagnosi : NSManagedObject

@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSSet *sedute;
@property (nonatomic, retain) Trattamento *trattamento;
@end

@interface Diagnosi (CoreDataGeneratedAccessors)

- (void)addSeduteObject:(Seduta *)value;
- (void)removeSeduteObject:(Seduta *)value;
- (void)addSedute:(NSSet *)values;
- (void)removeSedute:(NSSet *)values;

@end
