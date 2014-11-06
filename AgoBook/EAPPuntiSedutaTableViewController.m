//
//  EAPPuntiSedutaTableViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 15/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPuntiSedutaTableViewController.h"
#import "CoreDataHelper.h"
#import "EAPAppDelegate.h"
#import "Punto.h"
#import "AcuPoint.h"
#import "EAPPuntiNuovaSedutaCell.h"
#import "EAPPuntoProgressBar.h"

#import "DEMONavigationController.h"
#import "DEMOMenuViewController.h"
#import "EAPTavolePuntiCommonViewController.h"
#import "EAPLungViewController.h"
#import "EAPLargeIntestinViewController.h"
#import "EAPStomachViewController.h"
#import "EAPSpleenOneViewController.h"
#import "EAPSpleenTwoViewController.h"
#import "EAPHeartViewController.h"
#import "EAPSmallIntestineViewController.h"
#import "EAPBladderViewController.h"
#import "EAPKidneyViewController.h"
#import "EAPPericardiumViewController.h"
#import "EAPTripleBurnerViewController.h"
#import "EAPGallBladderViewController.h"
#import "EAPLiverViewController.h"
#import "EAPDuMaiViewController.h"
#import "EAPRenMaiViewController.h"

#define debug 1

#define TAVOLEACUPOINTS @"acupointsSegue"

#define kSecondsForCompleteUpdate   1680.0 /*28 minuti per completare il trattamento*/
#define kUpdateInterval             1

@interface EAPPuntiSedutaTableViewController ()

@property (strong, nonatomic) DEMONavigationController *destionation;

@property (strong, nonatomic) Punto *puntoScelto;
@property (strong, nonatomic) EAPPuntiNuovaSedutaCell *cellaScelta;
@property (assign) NSInteger index;

@end

@implementation EAPPuntiSedutaTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - DATA

- (void) configureFetch {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Punto"];
    request.sortDescriptors = @[];
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:cdh.context sectionNameKeyPath:nil cacheName:nil];
     self.fetchedResultsController.delegate = self;
    
}
     

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    //[self.tableView registerClass: [EAPPuntiNuovaSedutaCell class] forCellReuseIdentifier:@"puntosedutaCell"];
    [self configureFetch];
    [self performFetch];
    self.puntoScelto = nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (debug==1) {
        NSLog(@"Running %@ '%@'", self.class, NSStringFromSelector(_cmd));
    }
    
    static NSString *CellIdentifier = @"puntosedutaCell";
    EAPPuntiNuovaSedutaCell *cell = (EAPPuntiNuovaSedutaCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    /*
    for(UIView *view in cell.contentView.subviews){
        [view removeFromSuperview];
    }
    */
    // richiama il punto che popola la cell
    Punto *p = (Punto *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    // Istanzia un UIButton per avviare il count
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(600, 10, 40, 20);
    [button setTitle:@"Avvia" forState:UIControlStateNormal];
    [cell.contentView addSubview:button];
    // aggiungiamo la funzionalita'
    [button addTarget:cell action:@selector(startProgressTapped:) forControlEvents:UIControlEventTouchUpInside];
    
    EAPPuntoProgressBar *barra = [[EAPPuntoProgressBar alloc] initWithFrame:CGRectMake(200, 7, 200, 44)];
    [cell.contentView addSubview:barra];
    cell.progressView = barra;
    
    cell.txtFieldPunto.delegate = cell;
    cell.punto = p;
    cell.txtFieldPunto.text = p.punto;
    
    return cell;
}

-(void)populateList{
    [self.tableView reloadData];
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    NSLog(@"nella table view");
}

/* In a storyboard-based application, you will often want to do a little preparation before navigation */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:TAVOLEACUPOINTS]) {
        if ([[UIDevice currentDevice].model rangeOfString:@"Simulator"].location != NSNotFound) {
            self.cellaScelta = (EAPPuntiNuovaSedutaCell *)([[sender superview] superview]);
        } else {
            self.cellaScelta = (EAPPuntiNuovaSedutaCell *)([[[sender superview] superview] superview]);
        }
        /*
        self.destionation = (EAPTavoleTabBarViewController *)segue.destinationViewController;
        self.destionation.punto = [[self.fetchedResultsController fetchedObjects] objectAtIndex:self.cellaScelta.tag];
        self.destionation.delegateVC = self;
         */
        
        EAPLungViewController *lungVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LungVC"];
        EAPLargeIntestinViewController *liVC = [self.storyboard instantiateViewControllerWithIdentifier:@"LargeIntestineVC"];
        EAPStomachViewController *stVC = [self.storyboard instantiateViewControllerWithIdentifier:@"stomachVC"];
        EAPSpleenOneViewController *spVC = [self.storyboard instantiateViewControllerWithIdentifier:@"spleenOneVC"];
        EAPSpleenTwoViewController *spVC2 = [self.storyboard instantiateViewControllerWithIdentifier:@"spleenTwoVC"];
        EAPHeartViewController *heVC = [self.storyboard instantiateViewControllerWithIdentifier:@"heartVC"];
        EAPSmallIntestineViewController *siVC = [self.storyboard instantiateViewControllerWithIdentifier:@"smallIntestineVC"];
        EAPBladderViewController *blVC = [self.storyboard instantiateViewControllerWithIdentifier:@"bladderVC"];
        blVC.meridian = @"BL";
        blVC.titoloNavBar =  @"Meridiano della Vescica Urinaria";
        EAPKidneyViewController *kdVC = [self.storyboard instantiateViewControllerWithIdentifier:@"kidneyVC"];
        kdVC.meridian = @"KD";
        kdVC.titoloNavBar =  @"Meridiano del Rene";
        EAPPericardiumViewController *pcVC = [self.storyboard instantiateViewControllerWithIdentifier:@"pericardiumVC"];
        pcVC.meridian = @"PC";
        pcVC.titoloNavBar = @"Meridiano del Pericardio";
        EAPTripleBurnerViewController *tbVC = [self.storyboard instantiateViewControllerWithIdentifier:@"tripleBurnerVC"];
        tbVC.meridian = @"SJ";
        tbVC.titoloNavBar = @"Meridiano del Triplice Riscaldatore";
        EAPGallBladderViewController *gbVC = [self.storyboard instantiateViewControllerWithIdentifier:@"gallBladderVC"];
        gbVC.meridian = @"GB";
        gbVC.titoloNavBar = @"Meridiano della Vescica Biliare";
        EAPLiverViewController *livVC = [self.storyboard instantiateViewControllerWithIdentifier:@"liverVC"];
        livVC.meridian = @"LIV";
        livVC.titoloNavBar = @"Meridiano del Fegato";
        EAPDuMaiViewController *dmVC = [self.storyboard instantiateViewControllerWithIdentifier:@"duMaiVC"];
        dmVC.meridian = @"DU";
        dmVC.titoloNavBar = @"Meridiano DuMai";
        EAPRenMaiViewController *rmVC = [self.storyboard instantiateViewControllerWithIdentifier:@"renMaiVC"];
        rmVC.meridian = @"REN";
        rmVC.titoloNavBar = @"Meridiano RenMai";
        
        self.destionation = [[DEMONavigationController alloc] initWithRootViewController:lungVC];
        
        self.destionation.delegateVC = self;
        lungVC.delegate = self.destionation;
        liVC.delegate = self.destionation;
        stVC.delegate = self.destionation;
        spVC.delegate = self.destionation;
        spVC2.delegate = self.destionation;
        heVC.delegate = self.destionation;
        siVC.delegate = self.destionation;
        blVC.delegate = self.destionation;
        kdVC.delegate = self.destionation;
        pcVC.delegate = self.destionation;
        tbVC.delegate = self.destionation;
        gbVC.delegate = self.destionation;
        livVC.delegate = self.destionation;
        dmVC.delegate = self.destionation;
        rmVC.delegate = self.destionation;
        
        //[[self.destionation viewControllers] arrayByAddingObjectsFromArray:[NSArray arrayWithObjects:lungVC, liVC, nil]];
        
        DEMOMenuViewController *menuController = [[DEMOMenuViewController alloc] initWithStyle:UITableViewStylePlain];
        menuController.listaVC = [NSArray arrayWithObjects:lungVC, liVC, stVC, spVC, spVC2, heVC, siVC, blVC, kdVC, pcVC, tbVC, gbVC, livVC, dmVC, rmVC, nil];
        menuController.listaVociMenu = @[@"Polmone", @"Grosso Intestino", @"Stomaco", @"Milza&Pancreas 1",@"Milza&Pancreas2", @"Cuore", @"Intestino Tenue", @"Vescica Urinaria", @"Rene",@"Pericardio",@"Triplice Riscaldatore",@"Vescica Biliare", @"Fegato",@"DuMai",@"RenMai"];
        menuController.navigationController = self.destionation;
        
        REFrostedViewController *frostedViewController = [[REFrostedViewController alloc] initWithContentViewController:self.destionation menuViewController:menuController];
        frostedViewController.direction = REFrostedViewControllerDirectionLeft;
        frostedViewController.liveBlurBackgroundStyle = REFrostedViewControllerLiveBackgroundStyleLight;
        frostedViewController.liveBlur = YES;
        //frostedViewController.delegate = self;
        
        [self presentViewController:frostedViewController animated:YES completion:nil];
        
    }
    
}

- (void)selectedAcupoint:(AcuPoint *)acupoint fromController:(DEMONavigationController *)controller
{
    self.cellaScelta.punto.punto = acupoint.name;
    self.cellaScelta.punto.acupoint = acupoint;
    [self.destionation dismissViewControllerAnimated:YES completion:nil];
    
}

@end
