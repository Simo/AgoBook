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

@interface EAPRassSegniPersonaleViewController ()

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

- (void) configureFetch {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Segno"];
    request.sortDescriptors = @[];
    [request setFetchBatchSize:50];
    self.fetchedResultsController = [[NSFetchedResultsController alloc] initWithFetchRequest:request managedObjectContext:cdh.context sectionNameKeyPath:nil cacheName:nil];
     self.fetchedResultsController.delegate = self;
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureFetch];
    [self performFetch];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/*
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 0.0;
}
*/
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"RassegnaSegnoCell";
    EAPSegnoPersonaleTableViewCell *cell = (EAPSegnoPersonaleTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    Segno *segno = (Segno *)[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.lblNomeSegno.text = segno.nome;
    
    NSArray *tmp = [[NSArray alloc] initWithObjects:@"Primo",@"Secondo token",@"il terzo token non si dimentica mai", nil];
    cell.tokens = [NSMutableArray arrayWithArray:tmp];
    cell.tokenView = [[SBRTTokenView alloc] initWithFrame:CGRectMake(20, 20, 500, 150)];
    [cell.tokenView setDelegate:cell];
    [cell.tokenView refreshTokenView:cell.tokens];
    
    return cell;
    
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

@end
