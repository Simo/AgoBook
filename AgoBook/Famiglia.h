//
//  Famiglia.h
//  AgoBook
//
//  Created by Simone Bierti on 10/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona;

@interface Famiglia : NSManagedObject

@property (nonatomic, retain) NSString * commenti;
@property (nonatomic, retain) NSString * nucleo;
@property (nonatomic, retain) Persona *persona;

@end
