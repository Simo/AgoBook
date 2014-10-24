//
//  EAPSidebarNavigationController.m
//  AgoBook
//
//  Created by Simone Bierti on 15/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPSidebarNavigationController.h"

#define BACKHOME @"backHomeSegue"

@interface EAPSidebarNavigationController ()

@end

@implementation EAPSidebarNavigationController

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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:BACKHOME]) {
        NSLog(@"vado indietro!!!!!");
    }
}


@end
