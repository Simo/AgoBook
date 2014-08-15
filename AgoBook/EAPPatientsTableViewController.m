//
//  EAPPatientsTableViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 10/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPatientsTableViewController.h"
#import "Persona.h"
#import "EAPAppDelegate.h"
#import "CoreDataHelper.h"

@interface EAPPatientsTableViewController ()

@end

@implementation EAPPatientsTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void) configureFetch {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    self.managedObjectContext = [cdh context];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Persona"];
    //request.predicate = [NSPredicate predicateWithFormat:@"ZPERSONA = %i", self.selectedPersonId];
    request.sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"cognome"
                                                                                     ascending:YES
                                                                                      selector:@selector(localizedCaseInsensitiveCompare:)]];;
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    self.fetchedResultsController.delegate = self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self configureFetch];
    [self performFetch];
    self.searchResults = [NSMutableArray arrayWithCapacity:[[self.fetchedResultsController fetchedObjects] count]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
	if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        return [self.searchResults count];
    }
	else
	{
        return [[[self.fetchedResultsController sections] objectAtIndex:section] numberOfObjects];
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"pazienteCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
   
    if (cell == nil && tableView != self.tableView) {
        cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    }
    
    Persona *persona = nil;
    
    if (tableView == self.searchDisplayController.searchResultsTableView)
	{
        NSLog(@"Configuring cell to show search results");
        persona = [self.searchResults objectAtIndex:indexPath.row];
    }
	else
	{
        NSLog(@"Configuring cell to show normal data");
        persona = [self.fetchedResultsController objectAtIndexPath:indexPath];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",[persona.cognome capitalizedString], [persona.nome capitalizedString]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    Persona *persona = (Persona *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    [self.behaviorDelegate openPersonaDiary:persona fromController:self];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark -
#pragma mark Content Filtering

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope
{
	NSLog(@"Previous Search Results were removed.");
	[self.searchResults removeAllObjects];
    
	for (Persona *persona in [self.fetchedResultsController fetchedObjects])
	{
		if ([scope isEqualToString:@"All"] || [persona.cognome isEqualToString:scope])
		{
			NSComparisonResult result = [persona.cognome compare:searchText
                                                   options:(NSCaseInsensitiveSearch|NSDiacriticInsensitiveSearch)
                                                     range:NSMakeRange(0, [searchText length])];
            if (result == NSOrderedSame)
			{
				[self.searchResults addObject:persona];
            }
		}
	}
}

#pragma mark -
#pragma mark UISearchDisplayController Delegate Methods

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [self filterContentForSearchText:searchString scope:@"All"];
    return YES;
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchScope:(NSInteger)searchOption
{
    [self filterContentForSearchText:[self.searchDisplayController.searchBar text] scope:@"All"];
    return YES;
}

@end
