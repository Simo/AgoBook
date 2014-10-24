//
//  EAPTrattamentoGenerator.h
//  AgoBook
//
//  Created by Simone Bierti on 19/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Trattamento;
@class Anamnesi;
@class EsameObiettivo;
@class Diagnosi;
@class Persona;


@interface EAPTrattamentoGenerator : NSObject

@property (strong, nonatomic) NSManagedObjectContext *moc;

- (Trattamento *) creaTrattamentoPerPersona:(Persona *)persona;

- (id) initWithMoc:(NSManagedObjectContext *)context;
@end
