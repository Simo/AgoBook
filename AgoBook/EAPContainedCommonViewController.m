//
//  EAPContainedCommonViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 16/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPContainedCommonViewController.h"

@interface EAPContainedCommonViewController ()

@property (strong, nonatomic) NSManagedObjectID *selectedPerson;

@end

@implementation EAPContainedCommonViewController

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

@end
