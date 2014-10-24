//
//  EAPRassegnaGenerator.m
//  AgoBook
//
//  Created by Simone Bierti on 18/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPRassegnaGenerator.h"
#import "Persona.h"
#import "Rassegna.h"
#import "Segno.h"
#import "SegnoPersonale.h"
#import "SegnoTag.h"
#import "NSString+DateConverter.h"

@implementation EAPRassegnaGenerator

- (id) initWithPersona:(Persona *)persona
{
    self = [super init];
    
    if(self){
        _moc = [persona managedObjectContext];
    }
    
    return self;
    
}

- (NSArray *) listaSegni{
    NSString *entityName = @"Segno";
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"priority"
                                                                                     ascending:YES
                                                                                      selector:@selector(compare:)]];
    
    
    
    // NSEntityDescription *entityDescription = [NSEntityDescription entityForName:@"Segno" inManagedObjectContext:[[self cdh] context]];
    
    NSError *error = nil;
    NSArray *array = [_moc executeFetchRequest:request error:&error];
    
    return array;
}

- (Rassegna *) creaRassegnaPerPersona:(Persona *)persona
{
    // creare una oggetto rassegna
    Rassegna *nuovaRassegna = [NSEntityDescription insertNewObjectForEntityForName:@"Rassegna" inManagedObjectContext:_moc];
    
    NSDateFormatter *dateformate=[[NSDateFormatter alloc]init];
    [dateformate setDateFormat:@"dd/MM/YYYY"];
    NSString *date_String=[dateformate stringFromDate:[NSDate date]];
    
    [nuovaRassegna setDataInserimento:[date_String dateFromString]];
    // recuperare la lista dei segni
    NSArray *segni = [self listaSegni];
    // inserire per ogni segno della lista un segno tag in rassegna
    for (Segno *segno in segni) {
        //crea un segno personale al quale appendere il segno in questione
        SegnoPersonale *segnoP = [NSEntityDescription insertNewObjectForEntityForName:@"SegnoPersonale" inManagedObjectContext:_moc];
        [segnoP setSegno:segno];
        // crea un tag da aggiungere al set dei tag
        //SegnoTag *tag1 = [NSEntityDescription insertNewObjectForEntityForName:@"SegnoTag" inManagedObjectContext:_moc];
        // diamo una prima stringa al tag
        //[tag1 setDescrizione:[NSString stringWithFormat:@"%@",segno.priority]];
        //segnoP.tags = [[NSSet alloc] initWithObjects:tag1, nil];
        [nuovaRassegna addSegnipersonaliObject:segnoP];
    }
    // inserire nella persona la nuova rassegna
    [persona addRassegnaSegniObject:nuovaRassegna];
    // rendere la rassegna
    return nuovaRassegna;
}

- (Rassegna *) duplicaRassegna:(Rassegna *)rassegna perPersona:(Persona *)persona
{
    Rassegna *nuovaRassegna = [Rassegna new];

    return nuovaRassegna;
}

@end
