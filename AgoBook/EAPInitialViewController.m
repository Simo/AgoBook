//
//  EAPInitialViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPInitialViewController.h"
#import "EAPAppDelegate.h"
#import "CoreDataHelper.h"
#import "Persona.h"
#import "EAPRassegnaGenerator.h"


#define DiaryIdentifier @"DiarySegue"
#define ListaPazientiIdentifier @"ListaPazienti"


@interface EAPInitialViewController ()

@property (strong,nonatomic) EAPMainViewController *mainController;
@property (strong,nonatomic) EAPPatientsTableViewController *patientsController;

@end

@implementation EAPInitialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.personaScelta = nil;
    if (!_managedObjectContext) {
        CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
        _managedObjectContext = [cdh context];
    }
    UIImage *image = [UIImage imageNamed:@"base.png"];
    //UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 480)];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [self.view insertSubview:imageView atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:DiaryIdentifier]){
        self.mainController = segue.destinationViewController;
        self.mainController.personaScelta = self.personaScelta;
        [segue.destinationViewController didMoveToParentViewController:self];
    } else if([segue.identifier isEqualToString:ListaPazientiIdentifier]){
        [[segue destinationViewController] setDelegateAddresser:self];
        UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.pazientiPopoverController = popoverController;
        popoverController.delegate = self;
    }
}

-(void)openPersonaDiary:(Persona *)persona fromController:(EAPPopOverPazientiViewController *)controller {
    self.personaScelta = persona;
    [self performSegueWithIdentifier:DiaryIdentifier sender:self];
    //[self.popOver dismissPopoverAnimated:NO];
}

-(void)aggiungiNuovaPersona:(EAPPopOverPazientiViewController *)controller {
    NSLog(@"moc: %@",self.managedObjectContext);
    NSLog(@"ps: %@",self.personaScelta);
    self.personaScelta = [NSEntityDescription insertNewObjectForEntityForName:@"Persona" inManagedObjectContext:self.managedObjectContext];
    EAPRassegnaGenerator *generatore = [[EAPRassegnaGenerator alloc] initWithPersona:self.personaScelta];
    Rassegna *nuovaRassegna = [generatore creaRassegnaPerPersona:self.personaScelta];
    [self.personaScelta addRassegnaSegniObject:nuovaRassegna];
    [self performSegueWithIdentifier:DiaryIdentifier sender:self];
}

-(void)pazientiPopoverDidFinish:(EAPPopOverPazientiViewController *)controller {
    [self.pazientiPopoverController dismissPopoverAnimated:NO];
    self.pazientiPopoverController = nil;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.pazientiPopoverController = nil;
}

@end
