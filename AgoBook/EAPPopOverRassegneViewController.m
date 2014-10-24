//
//  EAPPopOverRassegneViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 17/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPopOverRassegneViewController.h"
#import "Persona.h"

#define ListaRassegneEmbedIdentifier @"RassegneTableViewEmbed"

@interface EAPPopOverRassegneViewController ()

@end

@implementation EAPPopOverRassegneViewController

-(void)awakeFromNib {
    //self.contentSizeForViewInPopover = CGSizeMake(300.0, 500.0);
    CGFloat height = 43.0 * [[self.personaScelta.rassegnaSegni allObjects] count];
    self.preferredContentSize = CGSizeMake(320.0, height);
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:ListaRassegneEmbedIdentifier]){
        self.rassegneController = segue.destinationViewController;
        self.rassegneController.personaScelta = self.personaScelta;
        self.rassegneController.behaviorDelegate = self;
    }
}



#pragma mark - Protocols

- (void) openRassegna:(Rassegna *)rassegna fromController:(EAPRassegneTableViewController *)controller
{
    [self.behaviorDelegate openRassegna:rassegna fromController:self];
}

@end
