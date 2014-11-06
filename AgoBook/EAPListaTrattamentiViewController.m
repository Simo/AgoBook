//
//  EAPListaTrattamentiViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPListaTrattamentiViewController.h"
#import "EAPAppDelegate.h"
#import "CoreDataHelper.h"
#import "Persona.h"
#import "Trattamento.h"
#import "Seduta.h"
#import "NSDate+StringConverter.h"


@interface EAPListaTrattamentiViewController ()

@end

@implementation EAPListaTrattamentiViewController

#define debug 1

- (void) configureFetch {
    //CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    //self.managedObjectContext = [cdh context];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Trattamento"];
    request.predicate = [NSPredicate predicateWithFormat:@"persona = %@", self.personaScelta];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dataInizio"
                                                                                     ascending:NO
                                                                                      selector:@selector(compare:)]];
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request
                                                                        managedObjectContext:[self.personaScelta managedObjectContext]
                                                                          sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureFetch];
    [self performFetch];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [[self.fetchedResultsController fetchedObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"listaTrattamentiCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil && tableView != self.tableView) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    Trattamento *trattamento = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(200, 12, 100, 22)];
    label.text = [NSString stringWithFormat:@"%@",[trattamento.dataInizio stringFromDate]];
    [cell.contentView addSubview:label];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",trattamento.descrizione];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //[self.behaviorDelegate listaTrattamentiRowSelected:self withIndexPath:indexPath];
    Trattamento *trattamento = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self.behaviorDelegate trattamentoSelected:trattamento inController:self];
}

@end
