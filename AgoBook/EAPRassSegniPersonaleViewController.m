//
//  EAPRassSegniPersonaleViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPRassSegniPersonaleViewController.h"
#import "CoreDataHelper.h"
#import "EAPAppDelegate.h"
#import "Segno.h"
#import "EAPSegnoPersonaleTableViewCell.h"
#import "Rassegna.h"
#import "SegnoPersonale.h"
#import "SegnoTag.h"
#import "Elemento.h"
#import "NSDate+StringConverter.h"
#import "EAPRassegnaGenerator.h"

#define RassegneIdentifier @"popOverRassegne"

@interface EAPRassSegniPersonaleViewController ()

@property (strong,nonatomic) NSArray *rass;

@end

@implementation EAPRassSegniPersonaleViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

#pragma mark - DATA

- (void) configureFetch:(Rassegna *)rassegna {
    //CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    //NSArray *au = [self.selectedPersona.rassegnaSegni allObjects];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SegnoPersonale"];
    request.predicate = [NSPredicate predicateWithFormat:@"rassegna = %@",rassegna];
    //NSLog(@"%@", [self.selectedPersona.rassegnaSegni all]);
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"segno.priority"
                                                                                     ascending:YES
                                                                                      selector:@selector(compare:)]];;
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self.selectedPersona managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
     self.fetchedResultsController.delegate = self;
    
}

- (void) fetchTags {
    //CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"SegnoTag"];
    request.sortDescriptors = @[];
    self.fetchedTags = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self.selectedPersona managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dataInserimento" ascending:NO]];
    
    NSArray *sortedRassegna = [[self.selectedPersona.rassegnaSegni allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    
    [self configureFetch:[sortedRassegna objectAtIndex:0]];
    [self performFetch];
    self.rass = [self.fetchedResultsController fetchedObjects];
    
    self.UINavItem.title = [NSString stringWithFormat:@"Rassegna segni del %@", [[[sortedRassegna objectAtIndex:0] dataInserimento] stringFromDate]];
    self.UINavItem.rightBarButtonItem.title = [NSString stringWithFormat:@"Rassegne (%lu)", (unsigned long)[sortedRassegna count]];

    //NSArray *au = [self.selectedPersona.rassegnaSegni allObjects];
    //self.rass = [[[au objectAtIndex:0] segnipersonali] allObjects];
    
    //NSLog(@"questo e il frutto del fetch: %lu", (unsigned long)[self.rass count]);
    //Rassegna *rass = [[(Rassegna *)[[self.fetchedResultsController fetchedObjects] objectAtIndex:0] ]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /*NSArray *strings = [[NSArray alloc] initWithObjects:@"Primo",@"Secondo token",@"il terzo token non si dimentica mai", nil];
    if(indexPath.row == 1){
       strings = [[NSArray alloc] initWithObjects:@"Primo",@"Secondo token",@"il terzo token non si dimentica mai", @"Ancora", @"Non basta realmente mai", @"molti più token",  nil];
    }*/
    NSSet *sc = [[self.rass objectAtIndex:indexPath.row ] valueForKey:@"tags"];
    NSArray *strings = [NSArray arrayWithArray: [sc allObjects]];
    
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    for(SegnoTag *tag in strings){
        [tmp addObject:tag.descrizione];
    }
    NSArray *arr = [NSArray arrayWithArray:tmp];
    return [SBRTTokenView heightForTokenViewFromArray:arr withFont:[UIFont systemFontOfSize:(18.0f)] withViewWidth:(664.0f)] + 50.0f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    // definisce una stringa che identifichi la cella
    static NSString *cellIdentifier = @"RassegnaSegnoCell";
    // istanzia una cella del tipo predefinito
    EAPSegnoPersonaleTableViewCell *cell = (EAPSegnoPersonaleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellEditingStyleNone;
    // definisce 2 parametri per definire 2 tag per le subviews che verranno istanziate
    NSInteger ident = 1000 + indexPath.row + 1;
    NSInteger tokenIdent = 1000 - indexPath.row - 1;
    
    //[cell.contentView clearsContextBeforeDrawing];
    
    for(UIView *view in cell.contentView.subviews){
        //if ([view isKindOfClass:[UITextField class]] || [view isKindOfClass:[UILabel class]]) {
        //} else {
            [view removeFromSuperview];
        //}
        //if ([view isKindOfClass:[UIView class]]) {
        //    [view removeFromSuperview];
        //}
    }
    
    // recupera il segnopersonale specifico attraverso l'indexpath
    SegnoPersonale *segno = (SegnoPersonale *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    [cell setSegnoPersonale:segno];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 5, 250, 45)];
    [label setFont:[UIFont fontWithName:@"HFFZeldomZen" size:22]];
    [cell.contentView addSubview:label];
    
    // imposta il nome del segno nel label
    //cell.lblNomeSegno.text = segno.segno.nome;
    label.text = segno.segno.nome;
    
    NSString *elements = [[NSString alloc] init];
    for (Elemento *elemento in segno.segno.elementi) {
        if ([elements isEqualToString:@""]) {
            elements = [NSString stringWithFormat:@"%@",elemento.nome ];
        } else {
            elements = [NSString stringWithFormat:@"%@, %@",elements,elemento.nome ];
        }
    }
    
    UILabel *elementi = [[UILabel alloc] initWithFrame:CGRectMake(251, 0, 100, 45)];
    [cell.contentView addSubview:elementi];
    elementi.text = elements;
    
    UITextField *txtField = [[UITextField alloc] initWithFrame:CGRectMake(355, 0, 250, 45)];
    [txtField setBorderStyle:UITextBorderStyleRoundedRect];
    //cell.txtFieldSegniTag = txtField;
    [cell.contentView addSubview:txtField];
    [txtField setDelegate:cell];
    
    
    txtField.inputAccessoryView = [[UIView alloc] initWithFrame:CGRectMake(0, 0,1024, 40)];
    txtField.inputAccessoryView.backgroundColor = [UIColor colorWithWhite:0.973 alpha:1.0];
    txtField.inputAccessoryView.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
    
    
    // estrae i'array dei tags per il segnopersonale selezionato e li mette in un array
    NSSet *sc = [[self.rass objectAtIndex:indexPath.row ] valueForKey:@"tags"];
    //NSArray *strings = [NSArray arrayWithArray: [sc allObjects]];
    
    NSMutableArray *tmp = [[NSMutableArray alloc] init];
    for(SegnoTag *tag in sc){
        [tmp addObject:tag.descrizione];
    }
    
    NSMutableArray *tmp2 = [[NSMutableArray alloc] init];
    for(SegnoTag *tag in sc){
        [tmp2 addObject:tag];
    }
    
    [cell setTokens:tmp];
    //cell.containerTokenScroll = [[UIScrollView alloc] initWithFrame:CGRectMake( 0, 0, 500, 30)];
    CGFloat height = [SBRTTokenView heightForTokenViewFromArray:tmp withFont:[UIFont systemFontOfSize:(18.0f)] withViewWidth:(664.0f)];
    // fissa il delegato della cella sulla tableview
    [cell setDelegate:self];
    
    // viene creata una view che conterra' i token - le dimensioni sono 0
    //cell.containerTokenView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    // viene affidato un tag alla view appena creata
    
    cell.containerTokenView = [[UIView alloc] initWithFrame:CGRectMake(20, 50, 664, height + 10)];
    //[cell.containerTokenView setFrame:CGRectMake(20, 50, 664, height + 10)];
    [cell.containerTokenView setTag:ident];
    
    // alloca anche la vista per la proprieta' tokenview
    //cell.tokenView = [[SBRTTokenView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    cell.tokenView = [[SBRTTokenView alloc] initWithFrame:CGRectMake(0, 0, 664, height)];
    [cell.tokenView setTag:tokenIdent];
    
    [cell.containerTokenView addSubview:cell.tokenView];
    
    
    
   /*
   if (![cell viewWithTag:ident]){
        NSLog(@"building view: %li and tknvw: %li", (long)ident,(long)tokenIdent);
        cell.containerTokenView = (UIView *)[cell viewWithTag:ident];
        cell.tokenView = (SBRTTokenView *)[cell viewWithTag:tokenIdent];
        [cell.contentView addSubview:cell.containerTokenView];
    }*/
    [cell.contentView addSubview:cell.containerTokenView];
    //[cell.containerTokenView setFrame:CGRectMake(20, 50, 664, height + 10)];
    
    
    //cell.tokenView = [[SBRTTokenView alloc] initWithFrame:CGRectMake(0, 0, 664, height)];
    //[[cell.tokenView layer] setBorderWidth:2.0f];
    //[cell.containerTokenView addSubview:cell.tokenView];
    //[cell.txtFieldSegniTag setDelegate:cell];
    [cell.tokenView setDelegate:cell];
    [cell.tokenView refreshTokenViewWithSegnoTags:tmp2];
    //[cell.tokenView refreshTokenView:cell.tokens forCell:indexPath.row];
    //[cell.contentView setBackgroundColor:[UIColor greenColor]];
    
    //[cell.contentView addSubview:cell.containerTokenView];
    
    return cell;
    
}

-(void)reloadDataOnTableView:(EAPSegnoPersonaleTableViewCell *)controller {
    [self.tableView reloadData];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:RassegneIdentifier])
    {
        self.popOverRassegne = segue.destinationViewController;
        self.popOverRassegne.personaScelta = self.selectedPersona;
        self.popOverRassegne.behaviorDelegate = self;
    }
}

- (void)openRassegna:(Rassegna *)rassegna fromController:(EAPPopOverRassegneViewController *)controller
{
    [self configureFetch:rassegna];
    [self performFetch];
    self.rass = [self.fetchedResultsController fetchedObjects];
    self.UINavItem.title = [NSString stringWithFormat:@"Rassegna segni del %@", [[rassegna dataInserimento] stringFromDate]];
    [self.tableView reloadData];
}

- (IBAction)aggiungiRassegna:(id)sender
{
    EAPRassegnaGenerator *generatore = [[EAPRassegnaGenerator alloc] initWithPersona:self.selectedPersona];
    Rassegna *nuovaRassegna = [generatore creaRassegnaPerPersona:self.selectedPersona];
    [self configureFetch:nuovaRassegna];
    [self performFetch];
    self.rass = [self.fetchedResultsController fetchedObjects];
    self.UINavItem.title = [NSString stringWithFormat:@"Rassegna segni del %@", [[nuovaRassegna dataInserimento] stringFromDate]];
    self.UINavItem.rightBarButtonItem.title = [NSString stringWithFormat:@"Rassegne (%lu)", (unsigned long)[[self.selectedPersona.rassegnaSegni allObjects] count]];
    [self.tableView reloadData];
}

@end
