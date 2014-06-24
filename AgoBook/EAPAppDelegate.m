//
//  EAPAppDelegate.m
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPAppDelegate.h"
#import "EAPMainViewController.h"
#import "Persona.h"
#import "StoriaMedica.h"
#import "StoriaEmotiva.h"
#import "Trattamento.h"
#import "Diagnosi.h"
#import "Seduta.h"
#import "Punto.h"
#import "Segno.h"
#import "Elemento.h"
#import "Rassegna.h"
#import "SegnoTag.h"
//#import "SegnoPersonale.h"
#define debug 1

@implementation EAPAppDelegate
/*
@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;
@synthesize fetchedResultsController = _fetchedResultsController;
*/

- (void) setupFetchedResultsController
{
    // 1 - Decide what Entity you want
    NSString *entityName = @"Persona"; // Put your entity name here
    NSLog(@"Setting up a Fetched Results Controller for the Entity named %@", entityName);
    
    // 2 - Request that Entity
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    // 3 - Filter it if you want
    //request.predicate = [NSPredicate predicateWithFormat:@"Person.name = Blah"];
    
    // 4 - Sort it if you want
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"cognome"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    // 5 - Fetch it
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:[[self cdh] context]
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self.fetchedResultsController performFetch:nil];
}

- (NSArray *) listaSegni{
    NSString *entityName = @"Segno";
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:entityName];
    
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"priority"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];
    
     self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:[[self cdh] context]
                                                                          sectionNameKeyPath:nil
                                                                                   cacheName:nil];
    [self.fetchedResultsController performFetch:nil];
    
    return [self.fetchedResultsController fetchedObjects];
}


-(CoreDataHelper *) cdh
{
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    if(!_coreDataHelper){
        static dispatch_once_t predicate;
        dispatch_once(&predicate, ^{
            _coreDataHelper = [CoreDataHelper new];
        });
        [_coreDataHelper setupCoreData];
    }
    
    return _coreDataHelper;
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    /*
     */
    [self cdh];
    
    [self setupFetchedResultsController];
    
    if (![[self.fetchedResultsController fetchedObjects] count] > 0 ) {
        NSLog(@"!!!!! ~~> There's nothing in the database so defaults will be inserted");
        [self importCoreDataDefaultPeople];
    }
    else {
        NSLog(@"There's stuff in the database so skipping the import of default data.");
    }
    
    EAPMainViewController *controller = (EAPMainViewController *)self.window.rootViewController;
    controller.managedObjectContext = self.coreDataHelper.context;
    
    if(![[self.fetchedResultsController fetchedObjects] count] > 0 ) {
        [self.fetchedResultsController performFetch:nil];
    }
    else {
        NSLog(@"il conto di fetchResult è diverso 0");
    }
    
    controller.personaScelta = (Persona *)[[self.fetchedResultsController fetchedObjects] objectAtIndex:0];

    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[self cdh] saveContext];
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [[self cdh] saveContext];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void) insertElementiWithNome:(NSString *) nome {
    Elemento *elemento = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                  inManagedObjectContext:[[self cdh] context]];
    [elemento setNome:nome];
}

-(void) insertSegnoWithNome:(NSString *)nome descrizione:(NSString *)descrizione priority:(NSNumber *)priority {
    Segno *segno = [NSEntityDescription insertNewObjectForEntityForName:@"Segno"
                                                 inManagedObjectContext:[[self cdh] context]];
    [segno setNome:nome];
    [segno setDescrizione:descrizione];
    [segno setPriority:priority];
    
    if([segno.nome isEqualToString:@"OCCHI"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                           inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"legno"];
        [segno addElementiObject:elemento1];
    } else if([segno.nome isEqualToString:@"ORECCHI"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"acqua"];
        [segno addElementiObject:elemento1];
        Elemento *elemento2 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento2 setNome:@"fuoco"];
        [segno addElementiObject:elemento2];
    } else if([segno.nome isEqualToString:@"NASO"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"metallo"];
        [segno addElementiObject:elemento1];
    } else if([segno.nome isEqualToString:@"PELLE"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"metallo"];
        [segno addElementiObject:elemento1];
    } else if([segno.nome isEqualToString:@"UNGHIE"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"legno"];
        [segno addElementiObject:elemento1];
    } else if([segno.nome isEqualToString:@"OSSA"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"acqua"];
        [segno addElementiObject:elemento1];
    } else if([segno.nome isEqualToString:@"MUSCOLI"]){
        Elemento *elemento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Elemento"
                                                            inManagedObjectContext:[[self cdh] context]];
        [elemento1 setNome:@"terra"];
        [segno addElementiObject:elemento1];
    }

    
}

-(void) insertSegnoWith:(Segno *) segno {
    Segno *s = [NSEntityDescription insertNewObjectForEntityForName:@"Segno"
                                                 inManagedObjectContext:[[self cdh] context]];
    [s setNome:segno.nome];
    [s setDescrizione:segno.descrizione];
    [s setPriority:segno.priority];
    
    [[self cdh] saveContext];
}


-(Persona *) insertPersonaWithNome:(NSString *) nome cognome:(NSString *) cognome dataNascita:(NSString *) dataNascita sesso:(NSString *) sesso  {
    Persona * persona = [NSEntityDescription insertNewObjectForEntityForName:@"Persona"
                                                      inManagedObjectContext:[[self cdh] context]];
    [persona setNome:nome];
    [persona setCognome:cognome];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSLocale *locale = [[NSLocale alloc] initWithLocaleIdentifier:@"it-IT"];
    [formatter setLocale:locale];
    [formatter dateFromString:dataNascita];
    [persona setDataNascita:[formatter dateFromString:dataNascita]];
    [persona setSesso:sesso];
    /*
    UIImage *foto = [UIImage imageNamed:fotoURI];
    NSData *fotoConv = UIImagePNGRepresentation(foto);
    [persona setFoto:fotoConv];
     */
    StoriaMedica *storiaMedica = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaMedica" inManagedObjectContext:[[self cdh] context]];
    [storiaMedica setIncidenti:@"Nessuno in particolare, tutti nello specifico"];
    
    StoriaEmotiva *storiaEmotiva = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaEmotiva" inManagedObjectContext:[[self cdh] context]];
    [storiaEmotiva setSaporePref:@"Dolce un pò salato"];
    
    [persona setStoriamedica:storiaMedica];
    [persona setStoriaemotiva:storiaEmotiva];
    
    Diagnosi *diagnosi = [NSEntityDescription insertNewObjectForEntityForName:@"Diagnosi" inManagedObjectContext:[[self cdh] context]];
    [diagnosi setDescrizione:@"dolore alla sciatica"];
    
    Punto *punto1 = [NSEntityDescription insertNewObjectForEntityForName:@"Punto" inManagedObjectContext:[[self cdh] context]];
    [punto1 setPunto:@"P12"];
    Punto *punto2 = [NSEntityDescription insertNewObjectForEntityForName:@"Punto" inManagedObjectContext:[[self cdh] context]];
    [punto2 setPunto:@"P21"];
    
    NSSet *set = [[NSSet alloc] initWithObjects:punto1, punto2, nil];
    
    Seduta *seduta = [NSEntityDescription insertNewObjectForEntityForName:@"Seduta" inManagedObjectContext:[[self cdh] context]];
    [seduta setDataSeduta:[formatter dateFromString:@"10/01/2014"]];
    [seduta setPunti:set];
    
    NSSet *setSedute = [[NSSet alloc] initWithObjects:seduta, nil];
    
    [diagnosi setSedute:setSedute];
    
    Trattamento *trattamento1 = [NSEntityDescription insertNewObjectForEntityForName:@"Trattamento" inManagedObjectContext:[[self cdh] context]];
    [trattamento1 setDiagnosi:diagnosi];
    
    NSSet *setTrattamenti = [[NSSet alloc] initWithObjects:trattamento1, nil];
    
    [persona setTrattamenti:setTrattamenti];
    
    return persona;
}


-(void) insertRassegnaForPersona:(Persona *)persona {
    Rassegna *rassegna = [NSEntityDescription insertNewObjectForEntityForName:@"Rassegna" inManagedObjectContext:[[self cdh] context]];
    // recupera la lista dei segni disponibili
    NSArray * segni = [self listaSegni];
    
    //SegnoPersonale *segno1 = [NSEntityDescription insertNewObjectForEntityForName:@"SegnoPersonale" inManagedObjectContext:[[self cdh] context]];
    SegnoTag *tag1 = [NSEntityDescription insertNewObjectForEntityForName:@"SegnoTag" inManagedObjectContext:[[self cdh] context]];
    [tag1 setDescrizione:@"Cefalea a grappolo"];
    //segno1.segno = [segni objectAtIndex:0];
    //segno1.tags = [[NSSet alloc] initWithObjects:tag1, nil];
    persona.rassegnaSegni = rassegna;

}

-(void) importCoreDataDefaultPeople {
    NSLog(@"import default data");
    
    Persona *persona = [self insertPersonaWithNome:@"Simone" cognome:@"Bierti" dataNascita:@"03/07/1977" sesso:@"M"];
    
    [self insertSegnoWithNome:@"TESTA" descrizione:@"Emicrania. vertigini, cefalea" priority:@1];
    [self insertSegnoWithNome:@"OCCHI" descrizione:@"Occhiali, bruciore, lacrimazione" priority:@2];
    [self insertSegnoWithNome:@"ORECCHI" descrizione:@"Sordità, acufeni, ronzii, dolore, tinnito" priority:@3];
    [self insertSegnoWithNome:@"NASO" descrizione:@"Olfatto, epistassi" priority:@4];
    [self insertSegnoWithNome:@"DENTI" descrizione:@"" priority:@5];
    [self insertSegnoWithNome:@"GOLA" descrizione:@"Tonsillite, adenoidi, gusto, linguaggio" priority:@6];
    [self insertSegnoWithNome:@"PELLE" descrizione:@"Scura, grassa, lividi, eruzioni, prurito" priority:@7];
    [self insertSegnoWithNome:@"CAPELLI E CUOIO CAPELLUTO" descrizione:@"Secchi, grassi, colore" priority:@8];
    [self insertSegnoWithNome:@"UNGHIE" descrizione:@"Ondulate, fragili, deboli, sfaldate, scolorite" priority:@9];
    [self insertSegnoWithNome:@"OSSA" descrizione:@"Dolori, artrite, osteoporosi, fratture" priority:@10];
    [self insertSegnoWithNome:@"MUSCOLI" descrizione:@"Flaccidi, deboli, forti, spastici" priority:@11];
    [self insertSegnoWithNome:@"URINA" descrizione:@"Frequenza, controllo, colore, odore, infezioni, bruciore, ritenzione, sintomi ora del giorno" priority:@12];
    [self insertSegnoWithNome:@"SUDORE" descrizione:@"Sempre, mai, notte, salato, punti del corpo" priority:@13];
    [self insertSegnoWithNome:@"INTESTINO" descrizione:@"Diarrea, stitichezza, regolarità, " priority:@14];
    [self insertSegnoWithNome:@"SONNO" descrizione:@"Come dorme, quante ore, risvegli" priority:@15];
    [self insertSegnoWithNome:@"SOGNI" descrizione:@"Li ricorda, temi ricorrenti" priority:@16];
    [self insertSegnoWithNome:@"FUMO" descrizione:@"Cosa, quanto, come si sente, cerca di smettere" priority:@17];
    [self insertSegnoWithNome:@"BERE" descrizione:@"Cosa, quanto, thé, caffé, acqua, alcool" priority:@18];
    [self insertSegnoWithNome:@"DIETA" descrizione:@"Cosa mangia, quanto, regime alimentare" priority:@19];
    [self insertSegnoWithNome:@"MEDICINE" descrizione:@"Vitamine, integratori, lassativi, pillola, ansiolitici" priority:@20];
    [self insertSegnoWithNome:@"CICLO MESTRUALE" descrizione:@"Età, regolarità, durata, disturbi, flusso, fase del ciclo, gravidanza, parto, sessualità" priority:@21];
    [self insertSegnoWithNome:@"LIVELLO DI ENERGIA" descrizione:@"Generale: poca, tanta, troppa. Sessuale: tensione, frustrazione, desiderio, fantasie" priority:@22];
    [self insertSegnoWithNome:@"POLSI" descrizione:@"" priority:@23];
    [self insertSegnoWithNome:@"LINGUA" descrizione:@"" priority:@24];
    
    //[self insertRassegnaForPersona:persona];
    
    [[self cdh] saveContext];
}

@end
