//
//  EAPPopOverPazientiViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 14/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPopOverPazientiViewController.h"

#define ListaPazientiEmbededIdentifier @"ListaPazientiEmbeded"

@interface EAPPopOverPazientiViewController ()

@end

@implementation EAPPopOverPazientiViewController
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
*/

-(void)awakeFromNib {
    self.contentSizeForViewInPopover = CGSizeMake(300.0, 500.0);
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:ListaPazientiEmbededIdentifier]){
        self.patientsController = segue.destinationViewController;
        //self.patientsController.managedObjectContext = self.managedObjectContext;
        self.patientsController.behaviorDelegate = self;
    }
}

-(void) openPersonaDiary:(Persona *)persona fromController:(EAPPatientsTableViewController *)controller {
    [self.delegate openPersonaDiary:persona fromController:self];
    [self done:nil];
}

-(IBAction) aggiungiNuovaPersona:(id) sender {
    [self.delegate aggiungiNuovaPersona:self];
    [self done:nil];
}

-(void)done:(id)sender {
    [self.delegate pazientiPopoverDidFinish:self];
}

@end
