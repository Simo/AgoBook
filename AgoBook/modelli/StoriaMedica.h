//
//  StoriaMedica.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona;

@interface StoriaMedica : NSManagedObject

@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSString * effettiCollaterali;
@property (nonatomic, retain) NSString * incidenti;
@property (nonatomic, retain) NSString * interventi;
@property (nonatomic, retain) NSString * partiColpite;
@property (nonatomic, retain) NSString * ricoveri;
@property (nonatomic, retain) NSString * storiaMedicaFamiglia;
@property (nonatomic, retain) Persona *persona;

@end
