//
//  Elemento.h
//  AgoBook
//
//  Created by Simone Bierti on 25/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Segno;

@interface Elemento : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSSet *segni;
@end

@interface Elemento (CoreDataGeneratedAccessors)

- (void)addSegniObject:(Segno *)value;
- (void)removeSegniObject:(Segno *)value;
- (void)addSegni:(NSSet *)values;
- (void)removeSegni:(NSSet *)values;

@end
