//
//  EAPInitialViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPInitialViewController.h"
#import "EAPMainViewController.h"
#import "Persona.h"
#import "EAPPatientsTableViewController.h"


#define DiaryIdentifier @"DiarySegue"
#define ListaPazientiIdentifier @"ListaPazienti"


@interface EAPInitialViewController ()

@property (strong,nonatomic) EAPMainViewController *mainController;
@property (strong,nonatomic) EAPPatientsTableViewController *patientsController;

@end

@implementation EAPInitialViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:DiaryIdentifier]){
        self.mainController = segue.destinationViewController;
        self.mainController.personaScelta = self.personaScelta;
        [segue.destinationViewController didMoveToParentViewController:self];
    } else if([segue.identifier isEqualToString:ListaPazientiIdentifier]){
        NSLog(@"all'interno dell prepare segue patients list");
        self.patientsController = segue.destinationViewController;
        //self.popOver = [(UIStoryboardPopoverSegue *)segue popoverController];
        self.patientsController.managedObjectContext = self.managedObjectContext;
        self.patientsController.behaviorDelegate = self;
        //[segue.destinationViewController didMoveToParentViewController:self];
    }
}

-(void)openPersonaDiary:(Persona *)persona fromController:(EAPPatientsTableViewController *)controller {
    self.personaScelta = persona;
    [self performSegueWithIdentifier:DiaryIdentifier sender:self];
    [self.popOver dismissPopoverAnimated:NO];
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
