//
//  EAPNuovaSedutaViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 08/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPNuovaSedutaViewController.h"
#import "EAPPuntiSedutaTableViewController.h"
#import "CoreDataHelper.h"
#import "EAPAppDelegate.h"
#import "Seduta.h"
#import "Feedback.h"
#import "Punto.h"


@interface EAPNuovaSedutaViewController ()

@end

@implementation EAPNuovaSedutaViewController

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
    if (!self.seduta.feedbackNow) {
        self.seduta.feedbackNow = (Feedback *)[NSEntityDescription entityForName:@"Feedback" inManagedObjectContext:self.seduta.managedObjectContext];
    }
    if (!self.seduta.feedbackThen) {
        self.seduta.feedbackThen = (Feedback *)[NSEntityDescription entityForName:@"Feedback" inManagedObjectContext:self.seduta.managedObjectContext];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"embedPuntiSedutaTable"]){
        self.puntiList = segue.destinationViewController;
        [self addChildViewController:segue.destinationViewController];
        [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
    }
}

- (IBAction)insertButtonPressed:(UIButton *)button
{
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    Punto *nuovoPunto = [NSEntityDescription insertNewObjectForEntityForName:@"Punto" inManagedObjectContext:[cdh context]];
    nuovoPunto.punto = @"Punto";
    [self.puntiList populateList];
}

@end
