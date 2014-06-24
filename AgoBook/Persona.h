//
//  Persona.h
//  AgoBook
//
//  Created by Simone Bierti on 21/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Famiglia, Lavoro, Rassegna, StoriaEmotiva, StoriaMedica, Trattamento;

@interface Persona : NSManagedObject

@property (nonatomic, retain) NSString * cognome;
@property (nonatomic, retain) NSDate * dataNascita;
@property (nonatomic, retain) NSData * foto;
@property (nonatomic, retain) NSString * nome;
@property (nonatomic, retain) NSString * sesso;
@property (nonatomic, retain) Famiglia *famiglia;
@property (nonatomic, retain) Lavoro *lavoro;
@property (nonatomic, retain) StoriaEmotiva *storiaemotiva;
@property (nonatomic, retain) StoriaMedica *storiamedica;
@property (nonatomic, retain) NSSet *trattamenti;
@property (nonatomic, retain) Rassegna *rassegnaSegni;
@end

@interface Persona (CoreDataGeneratedAccessors)

- (void)addTrattamentiObject:(Trattamento *)value;
- (void)removeTrattamentiObject:(Trattamento *)value;
- (void)addTrattamenti:(NSSet *)values;
- (void)removeTrattamenti:(NSSet *)values;

@end
