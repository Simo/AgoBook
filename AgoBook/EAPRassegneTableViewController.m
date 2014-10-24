//
//  EAPRassegneTableViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 18/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPRassegneTableViewController.h"
#import "Persona.h"
#import "Rassegna.h"
#import "NSDate+StringConverter.h"

@interface EAPRassegneTableViewController ()

@end

@implementation EAPRassegneTableViewController

- (void) configureFetch {
    //CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    //self.managedObjectContext = [cdh context];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Rassegna"];
    request.predicate = [NSPredicate predicateWithFormat:@"persona = %@", self.personaScelta];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dataInserimento"
                                                                                     ascending:NO
                                                                                      selector:@selector(compare:)]];
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:[self.personaScelta managedObjectContext] sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureFetch];
    [self performFetch];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
//    if (tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        return [self.searchResults count];
//    }
//    else
//    {
//        return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
//    }
    return [[self.fetchedResultsController fetchedObjects] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"rassegnaCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil && tableView != self.tableView) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    Rassegna *rassegna = nil;
    
//    if (tableView == self.searchDisplayController.searchResultsTableView)
//    {
//        NSLog(@"Configuring cell to show search results");
//        persona = [self.searchResults objectAtIndex:indexPath.row];
//    }
//    else
//    {
//        NSLog(@"Configuring cell to show normal data");
//        persona = [self.fetchedResultsController objectAtIndexPath:indexPath];
//    }
    
    rassegna = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@", [rassegna.dataInserimento stringFromDate]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Rassegna *rassegna = (Rassegna *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self.behaviorDelegate openRassegna:rassegna fromController:self];
    
}

@end
