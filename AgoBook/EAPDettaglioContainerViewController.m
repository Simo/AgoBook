//
//  EAPDettaglioContainerViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPDettaglioContainerViewController.h"

#define SegueIdentifierProblemiVC @"ProblemiSegue"
#define SegueIdentifierListSeduteVC @"ListaSeduteSegue"
#define SegueIdentifierListPuntiVC @"ListaPuntiSegue"


@interface EAPDettaglioContainerViewController ()

@end

@implementation EAPDettaglioContainerViewController

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
    self.relativePositions = [[NSMutableDictionary alloc] initWithDictionary:@{SegueIdentifierProblemiVC: @0,
                                                 SegueIdentifierListSeduteVC:@1,
                                                SegueIdentifierListPuntiVC:@2}];

    //[self caricaChildVC:SegueIdentifierProblemiVC];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:SegueIdentifierProblemiVC]) {
        if(!self.problemiVC){
            self.problemiVC = segue.destinationViewController;
            self.problemiVC.delegate = self;
            self.problemiVC.trattamento = self.trattamentoScelto;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.problemiVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.problemiVC];
            self.currentViewController = self.problemiVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierListSeduteVC]) {
        if(!self.seduteVC){
            self.seduteVC = segue.destinationViewController;
            self.seduteVC.listaSedute = self.listaSedutePerSeduteVC;
            self.seduteVC.listaSedute = [self.trattamentoScelto.diagnosi.sedute allObjects];
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.seduteVC;
        } else {
            //self.seduteVC.listaSedute = self.listaSedutePerSeduteVC;
            [self swapFromViewController:self.currentViewController toViewController:self.seduteVC];
            //[self.seduteVC.tableView reloadData];
            self.currentViewController = self.seduteVC;
        }
    } else if ([segue.identifier isEqualToString:SegueIdentifierListPuntiVC]) {
        if(!self.puntiVC){
            self.puntiVC = segue.destinationViewController;
            NSNumber *number = [NSNumber numberWithInteger:[self.childViewControllers count]];
            [self.relativePositions setValue:number forKey:segue.identifier];
            [self addChildViewController:segue.destinationViewController];
            ((UIViewController *)segue.destinationViewController).view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
            [self.view addSubview:((UIViewController *)segue.destinationViewController).view];
            [segue.destinationViewController didMoveToParentViewController:self];
            self.currentViewController = self.puntiVC;
        } else {
            [self swapFromViewController:self.currentViewController toViewController:self.puntiVC];
            self.currentViewController = self.puntiVC;
        }
    }
}

-(void) swapFromViewController:(UIViewController *)fromViewController toViewController:(UIViewController *)toViewController
{
    toViewController.view.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    
    [fromViewController willMoveToParentViewController:nil];
    [self addChildViewController:toViewController];
    
    [self transitionFromViewController:fromViewController toViewController:toViewController duration:0.5 options:UIViewAnimationOptionTransitionCrossDissolve animations:nil completion:^(BOOL finished) {
        [fromViewController removeFromParentViewController];
        [toViewController didMoveToParentViewController:self];
        //self.transitionInProgress = NO;
    }];
}

-(void)caricaChildVC:(NSString *) segueIdentifier
{
    [self performSegueWithIdentifier:segueIdentifier sender:nil];
}

-(void)apriNuovaSedutaViewController:(EAPProblemiViewController *)controller {
    [self.behaviorDelegate apriNuovaSedutaViewController:self];
}

@end
