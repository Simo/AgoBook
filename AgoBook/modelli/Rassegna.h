//
//  Rassegna.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SegnoPersonale;

@interface Rassegna : NSManagedObject

@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) SegnoPersonale *segnipersonali;

@end
