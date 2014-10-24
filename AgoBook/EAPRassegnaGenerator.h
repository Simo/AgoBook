//
//  EAPRassegnaGenerator.h
//  AgoBook
//
//  Created by Simone Bierti on 18/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Persona;
@class Rassegna;

@interface EAPRassegnaGenerator : NSObject

@property (strong, nonatomic) NSManagedObjectContext *moc;

- (id) initWithPersona:(Persona *)persona;

- (Rassegna *) creaRassegnaPerPersona:(Persona *)persona;

- (Rassegna *) duplicaRassegna:(Rassegna *)rassegna perPersona:(Persona *)persona;

@end
