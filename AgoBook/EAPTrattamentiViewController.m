//
//  EAPTrattamentiViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPTrattamentiViewController.h"

@interface EAPTrattamentiViewController ()

@end

@implementation EAPTrattamentiViewController

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
    NSArray *array1 = [[NSArray alloc] initWithObjects:@"Seduta 11",@"Seduta 12",@"Seduta 13", @"Seduta 14", @"Seduta 15", @"Seduta 16", @"Seduta 17", @"Seduta 18", @"Seduta 19",nil];
    
    NSArray *array2 = [[NSArray alloc] initWithObjects:@"Seduta 21",@"Seduta 22",@"Seduta 23", @"Seduta 24", @"Seduta 25", @"Seduta 26", @"Seduta 27", @"Seduta 28", @"Seduta 29", @"Seduta 20",nil];
    
    self.array = [[NSArray alloc] initWithObjects:array1,array2, nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"ListaTrattamentiSegue"]) {
        self.listaTrattamentiVC = segue.destinationViewController;
        self.listaTrattamentiVC.behaviorDelegate = self;
        self.listaTrattamentiVC.personaScelta = self.selectedPerson;
        //self.listaTrattamentiVC.listaTrattamenti = [[NSArray alloc] initWithObjects:@"Trattamento 1",@"Trattamento 2",nil];
    } else if ([segue.identifier isEqualToString:@"DettaglioTrattamentoSegue"]){
        self.dettaglioTrattamentoVC = segue.destinationViewController;
        self.dettaglioTrattamentoVC.behaviorDelegate = self;
    }
}

#pragma mark - ListaTrattamenti delegate's methods

-(void)listaTrattamentiRowSelected:(EAPListaTrattamentiViewController *)controller withIndexPath:(NSIndexPath *)indexPath
{
    self.dettaglioTrattamentoVC.listaSedutePerSeduteVC = [self.array objectAtIndex:indexPath.row];
    [self.dettaglioTrattamentoVC caricaChildVC:@"ProblemiSegue"];
}

- (void)trattamentoSelected:(Trattamento *)trattamento inController:(EAPListaTrattamentiViewController *)controller
{
    // trattamento e' un oggetto CD quindi porta con se' riferimento a context
    
    // prima di tutto devo pulire le views caricate nel viewcontainer
    self.dettaglioTrattamentoVC;
    // per il trattamento passato recupero gli oggetti EsameObiettivo, Anamnesi e Diagnosi
    // dalla diagnosi recupero eventuali sedute
    // dalle sedute recupero i punti applicati
    // presento la vista con i "problemi", la prima
    
}

#pragma mark - DettaglioContainer delegate's methods

-(void)apriNuovaSedutaViewController:(EAPDettaglioContainerViewController *)controller {
    [self.delegate apriNuovaSedutaViewController:self];
}

- (IBAction)segmentChanged:(UISegmentedControl *)sender {
    //NSLog(@"segmented control in trattamenti -> %i", sender.selectedSegmentIndex);
    if(sender.selectedSegmentIndex == 0){
        [self.dettaglioTrattamentoVC caricaChildVC:@"ProblemiSegue"];
    } else if(sender.selectedSegmentIndex == 1){
        [self.dettaglioTrattamentoVC caricaChildVC:@"ListaSeduteSegue"];
    } else if(sender.selectedSegmentIndex == 2){
        [self.dettaglioTrattamentoVC caricaChildVC:@"ListaPuntiSegue"];
    }
}

@end
