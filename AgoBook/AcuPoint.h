//
//  AcuPoint.h
//  AgoBook
//
//  Created by Simone Bierti on 23/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Punto;

@interface AcuPoint : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * chineseName;
@property (nonatomic, retain) NSString * westernName;
@property (nonatomic, retain) NSString * english;
@property (nonatomic, retain) NSString * pinyin;
@property (nonatomic, retain) NSString * hanGeul;
@property (nonatomic, retain) NSString * romaji;
@property (nonatomic, retain) NSString * alternative;
@property (nonatomic, retain) NSString * meridian;
@property (nonatomic, retain) NSNumber * num;
@property (nonatomic, retain) NSSet *punti;
@end

@interface AcuPoint (CoreDataGeneratedAccessors)

- (void)addPuntiObject:(Punto *)value;
- (void)removePuntiObject:(Punto *)value;
- (void)addPunti:(NSSet *)values;
- (void)removePunti:(NSSet *)values;

@end
