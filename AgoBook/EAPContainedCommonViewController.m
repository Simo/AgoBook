//
//  EAPContainedCommonViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 16/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPContainedCommonViewController.h"
#import "CoreDataHelper.h"
#import "EAPAppDelegate.h"

@interface EAPContainedCommonViewController ()

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

-(id) fetchObjectFromId:(NSManagedObjectID *) selectedObjectId {
    CoreDataHelper *cdh = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] cdh];
    id obj = [cdh.context existingObjectWithID:self.selectedPersonId error:nil];
    return obj;
}

@end
