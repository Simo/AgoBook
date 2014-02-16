//
//  Lavoro.h
//  AgoBook
//
//  Created by Simone Bierti on 10/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona;

@interface Lavoro : NSManagedObject

@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSString * locazione;
@property (nonatomic, retain) NSString * soddisfazione;
@property (nonatomic, retain) Persona *persona;

@end
