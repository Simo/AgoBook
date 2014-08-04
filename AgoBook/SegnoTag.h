//
//  SegnoTag.h
//  AgoBook
//
//  Created by Simone Bierti on 13/07/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class SegnoPersonale;

@interface SegnoTag : NSManagedObject

@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) SegnoPersonale *segnoPersonale;

@end
