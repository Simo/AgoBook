//
//  EAPContentContainerViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPContentContainerViewController.h"
#import "EAPAppDelegate.h"
#import "CoreDataHelper.h"

#import "Persona.h"
#import "StoriaMedica.h"
#import "StoriaEmotiva.h"
#import "EAPStoriaMedicaViewController.h"
#import "EAPStoriaEmotivaViewController.h"
#import "EAPRassegnaSegniViewController.h"
#import "EAPRassSegniPersonaleViewController.h"
#import "EAPTrattamentiViewController.h"

#define SegueIdentifierAnagrafica @"AnagraficaSegue"
#define SegueIdentifierStoriaMedica @"StoriaMedicaSegue"
#define SegueIdentifierStoriaEmotiva @"StoriaEmotivaSegue"
#define SegueIdentifierRassegnaSegni @"RassSegniPersSegue"
#define SegueIdentifierTrattamenti @"TrattamentiSegue"
#define SegueIdentifierNuovaSeduta @"NuovaSedutaSegue"

@interface EAPContentContainerViewController ()

@end

@implementation EAPContentContainerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.relativePositions = [[NSMutableDictionary alloc] initWithDictionary:@{SegueIdentifierAnagrafica: @0,
                                                                               SegueIdentifierStoriaMedica:@1,
                                                                               SegueIdentifierStoriaEmotiva:@2,
                                                                               SegueIdentifierRassegnaSegni: @3,
                                                                               SegueIdentifierTrattamenti:@4,
                                                                               SegueIdentifierNuovaSeduta:@5}];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SEGUE MANAGEMENT

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierAnagrafica]) {
        if(!self.anagraficaVC){
            self.anagraficaVC = segue.destinationViewController;
            self.anagraficaVC.delegate = self;
            self.anagraficaVC.selectedPerson = self.persona;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            //configura le dimensioni
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            
            self.anagraficaVC.lblProva.text = @"io arrivo dal prepare";
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.anagraficaVC;
        } else {
            if(![self.anagraficaVC.lblProva.text isEqualToString:@"io arrivo dal prepare else"]){
                self.anagraficaVC.lblProva.text = @"io arrivo dal prepare else";
            } else {
                self.anagraficaVC.lblProva.text = @"entrato in volta pari";
            }
            [self swapFromViewController:self.currentViewController toViewController:self.anagraficaVC];
            self.currentViewController = self.anagraficaVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierStoriaMedica]) {
        if(!self.storiaMedicaVC){
            self.storiaMedicaVC = segue.destinationViewController;
            self.storiaMedicaVC.selectedPerson = self.persona;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.storiaMedicaVC;

        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.storiaMedicaVC];
            self.currentViewController = self.storiaMedicaVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierStoriaEmotiva]) {
        if(!self.storiaEmotivaVC){
            self.storiaEmotivaVC = segue.destinationViewController;
            self.storiaEmotivaVC.delegate = self;
            self.storiaEmotivaVC.selectedPerson = self.persona;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.storiaEmotivaVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.storiaEmotivaVC];
            self.currentViewController = self.storiaEmotivaVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierRassegnaSegni]) {
        if(!self.rassegnaSegniVC){
            self.rassegnaSegniVC = segue.destinationViewController;
            self.rassegnaSegniVC.delegate = self;
            self.rassegnaSegniVC.selectedPersona = self.persona;
            self.rassegnaSegniVC.selectedPersonId = [self.persona objectID];
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.rassegnaSegniVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.rassegnaSegniVC];
            self.currentViewController = self.rassegnaSegniVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierTrattamenti]) {
        if(!self.trattamentiVC){
            self.trattamentiVC = segue.destinationViewController;
            self.trattamentiVC.delegate = self;
            self.trattamentiVC.selectedPerson = self.persona;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.trattamentiVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.trattamentiVC];
            self.currentViewController = self.trattamentiVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierNuovaSeduta]){
        if(!self.nuovaSedutaVC){
            self.nuovaSedutaVC = segue.destinationViewController;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.nuovaSedutaVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.nuovaSedutaVC];
            self.currentViewController = self.nuovaSedutaVC;
        }
    }
}

- (void)swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        //self.transitionInProgress = NO;
    }];
}

-(void)willLoadContentViewFromMenu:(NSString *)nomeContentView
{
    [self performSegueWithIdentifier:nomeContentView sender:nil];
}


#pragma mark - DELEGATION ON CONTENT VCs

/*
#pragma mark ∆ Anagrafica

-(void)changeAnagraficaFields:(EAPAnagraficaViewController *)controller
{
    [[(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh] saveContext];
}
*/
-(void)populateAnagraficaViewFields:(EAPAnagraficaViewController *)controller{
    
}
-(void)changeAnagraficaFields:(EAPAnagraficaViewController *)controller{
    
}

#pragma mark ∆ StoriaMedica

-(void)populateStroriaMedicaFields:(EAPStoriaMedicaViewController *)controller {
    
}

-(void)changeStoriaMedicaFields:(EAPStoriaMedicaViewController *)controller {
    
}

#pragma mark ∆ StoriaEmotiva

-(void)populateStoriaEmotivaFields:(EAPStoriaEmotivaViewController *)controller {
   // controller.txtFieldAutoDescrizione.text = self.persona.storiaemotiva.autoDescrizione;
}

-(void)changeStoriaEmotivaFields:(EAPStoriaEmotivaViewController *)controller {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    if(!self.persona.storiaemotiva){
        StoriaEmotiva *storiaEmotiva = [NSEntityDescription insertNewObjectForEntityForName:@"StoriaEmotiva" inManagedObjectContext:[cdh context]];
     //   storiaEmotiva.autoDescrizione = controller.txtFieldAutoDescrizione.text;
        self.persona.storiaemotiva = storiaEmotiva;
    } else {
     //   self.persona.storiaemotiva.autoDescrizione = controller.txtFieldAutoDescrizione.text;
    }
}

#pragma mark ∆ RassegnaSegni

-(void)populateRassegnaSegniFields:(EAPRassegnaSegniViewController *)controller {
    
}

-(void)changeRassegnaSegniFields:(EAPRassegnaSegniViewController *)controller {
    
}

#pragma mark ∆ Trattamenti

-(void)apriNuovaSedutaViewController:(EAPTrattamentiViewController *)controller {
    [self performSegueWithIdentifier:SegueIdentifierNuovaSeduta sender:nil];
}

- (void) modifyTitleBarWithString:(NSString *)testo
{
    [self.delegate modifyTitleBarWithString:testo];
    NSLog(@"dentro container");
}

@end
