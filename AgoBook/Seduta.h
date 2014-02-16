//
//  Seduta.h
//  AgoBook
//
//  Created by Simone Bierti on 10/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Diagnosi, Punto;

@interface Seduta : NSManagedObject

@property (nonatomic, retain) NSDate * dataSeduta;
@property (nonatomic, retain) NSString * feedBackIst;
@property (nonatomic, retain) NSString * feedBackSucc;
@property (nonatomic, retain) Diagnosi *diagnosi;
@property (nonatomic, retain) NSSet *punti;
@end

@interface Seduta (CoreDataGeneratedAccessors)

- (void)addPuntiObject:(Punto *)value;
- (void)removePuntiObject:(Punto *)value;
- (void)addPunti:(NSSet *)values;
- (void)removePunti:(NSSet *)values;

@end
