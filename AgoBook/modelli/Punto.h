//
//  Punto.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Seduta;

@interface Punto : NSManagedObject

@property (nonatomic, retain) NSNumber * applicato;
@property (nonatomic, retain) NSDate * dataAppl;
@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSNumber * dolente;
@property (nonatomic, retain) NSString * punto;
@property (nonatomic, retain) NSString * tempoAppl;
@property (nonatomic, retain) Seduta *seduta;

@end
