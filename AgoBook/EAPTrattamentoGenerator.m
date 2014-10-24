//
//  EAPTrattamentoGenerator.m
//  AgoBook
//
//  Created by Simone Bierti on 19/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPTrattamentoGenerator.h"
#import "Trattamento.h"
#import "Persona.h"
#import "Anamnesi.h"
#import "EsameObiettivo.h"
#import "Diagnosi.h"
#import "NSString+DateConverter.h"
#import "NSDate+StringConverter.h"

@implementation EAPTrattamentoGenerator

- (id) initWithMoc:(NSManagedObjectContext *)context
{
    self = [super init];
    if(self){
        _moc = context;
    }
    return self;
    
}

- (Trattamento *)creaTrattamentoPerPersona:(Persona *)persona
{
    // creo un trattattamento mettendo come data inizio oggi e concluso come false
    Trattamento *nuovoTrattamento = [NSEntityDescription insertNewObjectForEntityForName:@"Trattamento" inManagedObjectContext:_moc];
    [nuovoTrattamento setDataInizio:[[[NSDate date] stringFromDate] dateFromString] ];
    [nuovoTrattamento setDescrizione:@"Breve descrizione"];
    // creo un anamnesi
    Anamnesi *anamnesi = [NSEntityDescription insertNewObjectForEntityForName:@"Anamnesi" inManagedObjectContext:_moc];
    // aggiungo a trattamento l'anamnesi
    [nuovoTrattamento setAnamnesi:anamnesi];
    // creo EsameObiettivo
    EsameObiettivo *esameObiettivo = [NSEntityDescription insertNewObjectForEntityForName:@"EsameObiettivo" inManagedObjectContext:_moc];
    // aggiungo a trattamento esameobiettivo
    [nuovoTrattamento setEsameObiettivo:esameObiettivo];
    // creo diagnosi
    Diagnosi *diagnosi = [NSEntityDescription insertNewObjectForEntityForName:@"Diagnosi" inManagedObjectContext:_moc];
    // aggiungo a trattamento diagnosi
    [nuovoTrattamento setDiagnosi:diagnosi];
    // aggiungo a persona il trattamento
    [persona addTrattamentiObject:nuovoTrattamento];
    // return di trattamento
    return nuovoTrattamento;
}

@end
