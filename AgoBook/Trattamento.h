//
//  Trattamento.h
//  AgoBook
//
//  Created by Simone Bierti on 19/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Anamnesi, Diagnosi, EsameObiettivo, Persona;

@interface Trattamento : NSManagedObject

@property (nonatomic, retain) NSNumber * concluso;
@property (nonatomic, retain) NSDate * dataFine;
@property (nonatomic, retain) NSDate * dataInizio;
@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) Anamnesi *anamnesi;
@property (nonatomic, retain) Diagnosi *diagnosi;
@property (nonatomic, retain) EsameObiettivo *esameObiettivo;
@property (nonatomic, retain) Persona *persona;

@end
