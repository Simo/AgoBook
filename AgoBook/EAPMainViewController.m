//
//  EAPMainViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPMainViewController.h"


@interface EAPMainViewController ()

@end

@implementation EAPMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    self.sideBarChildViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"sideBarMenu"];
    self.sideBarChildViewController.view.frame = self.sideBarViewContainer.bounds;
    [self addChildViewController:self.sideBarChildViewController];
    self.sideBarChildViewController.delegate = self;
    [self.sideBarViewContainer addSubview:self.sideBarChildViewController.view];
     */
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - SideBar Delegate methods

-(void)willLoadRespectiveViewController:(EAPSideBarViewController *)controller indexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            [self.contentContainer willLoadContentViewFromMenu:@"AnagraficaSegue"];
        } else if (indexPath.row == 1){
            [self.contentContainer willLoadContentViewFromMenu:@"StoriaMedicaSegue"];
        } else if (indexPath.row == 2){
            [self.contentContainer willLoadContentViewFromMenu:@"StoriaEmotivaSegue"];
        } else if (indexPath.row == 3){
            [self.contentContainer willLoadContentViewFromMenu:@"RassegnaSegniSegue"];
        } else if (indexPath.row == 4){
            [self.contentContainer willLoadContentViewFromMenu:@"TrattamentiSegue"];
        }
    } else if (indexPath.section == 3) {
        if (indexPath.row == 1) {
            [self.contentContainer willLoadContentViewFromMenu:@"NuovaSedutaSegue"];
        }
    }
}

#pragma mark - Flipside View Controller

- (void)flipsideViewControllerDidFinish:(EAPFlipsideViewController *)controller
{
    [self.flipsidePopoverController dismissPopoverAnimated:YES];
    self.flipsidePopoverController = nil;
}

- (void)popoverControllerDidDismissPopover:(UIPopoverController *)popoverController
{
    self.flipsidePopoverController = nil;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showAlternate"]) {
        [[segue destinationViewController] setDelegate:self];
        UIPopoverController *popoverController = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.flipsidePopoverController = popoverController;
        popoverController.delegate = self;
    } else if ([segue.identifier isEqualToString:@"embedContentContainer"]) {
        self.contentContainer = segue.destinationViewController;
        self.contentContainer.persona = self.personaScelta;
    } else if ([segue.identifier isEqualToString:@"sideBarSegue"]){
        self.sideBarChildViewController = segue.destinationViewController;
        self.sideBarChildViewController.delegate2 = self;
    }
}

- (IBAction)togglePopover:(id)sender
{
    if (self.flipsidePopoverController) {
        [self.flipsidePopoverController dismissPopoverAnimated:YES];
        self.flipsidePopoverController = nil;
    } else {
        [self performSegueWithIdentifier:@"showAlternate" sender:sender];
    }
}

@end
