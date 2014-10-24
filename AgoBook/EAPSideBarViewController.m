//
//  EASideBarViewController.m
//  ElenaAgo
//
//  Created by Simone Bierti on 31/10/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPSideBarViewController.h"
#import "Persona.h"
#import "Trattamento.h"
#import "NSDate+StringConverter.h"

#define BACKHOME @"backHomeSegue"

@interface EAPSideBarViewController ()

@end

@implementation EAPSideBarViewController

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
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"dataInizio" ascending:NO]];
    
    NSArray *sortedTrattamenti = [[self.personaScelta.trattamenti allObjects] sortedArrayUsingDescriptors:sortDescriptors];
    Trattamento *trattamento = [sortedTrattamenti objectAtIndex:0];
    
    NSString *titolo = [NSString stringWithFormat:@"%@ (del %@)",trattamento.descrizione,[trattamento.dataInizio stringFromDate]];
    
    self.ultimoTrattamento.textLabel.text = titolo;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //NSLog(@"sect:%i,index:%i",indexPath.section,indexPath.row);
    //UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    //NSLog(@"%@",cell.textLabel.text);
    [self.delegate2 willLoadRespectiveViewController:self indexPath:indexPath];
    //if(indexPath.row == 0){
    //    [self openAnagraficaView];
    //}
    //[tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:BACKHOME]) {
        // codice da eseguire
    }
}

@end
