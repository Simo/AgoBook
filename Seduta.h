//
//  Seduta.h
//  AgoBook
//
//  Created by Simone Bierti on 02/02/15.
//  Copyright (c) 2015 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Diagnosi, Punto, Feedback;

@interface Seduta : NSManagedObject

@property (nonatomic, retain) NSDate * dataSeduta;
@property (nonatomic, retain) Diagnosi *diagnosi;
@property (nonatomic, retain) NSSet *punti;
@property (nonatomic, retain) Feedback *feedbackNow;
@property (nonatomic, retain) Feedback *feedbackThen;
@end

@interface Seduta (CoreDataGeneratedAccessors)

- (void)addPuntiObject:(Punto *)value;
- (void)removePuntiObject:(Punto *)value;
- (void)addPunti:(NSSet *)values;
- (void)removePunti:(NSSet *)values;

@end
