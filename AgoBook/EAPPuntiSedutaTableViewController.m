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
#import "EAPPuntiNuovaSedutaCell.h"

#define debug 1

#define kSecondsForCompleteUpdate   1680.0 /*28 minuti per completare il trattamento*/
#define kUpdateInterval             1

@interface EAPPuntiSedutaTableViewController ()
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
    
    cell.txtFieldPunto.delegate = cell;
    Punto *p = (Punto *)[self.fetchedResultsController objectAtIndexPath:indexPath];
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

@end
