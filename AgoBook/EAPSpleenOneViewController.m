//
//  EAPSpleenOneViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/11/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPSpleenOneViewController.h"
#import "DEMONavigationController.h"

#define MERIDIAN @"SP"

@interface EAPSpleenOneViewController ()

@end

@implementation EAPSpleenOneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.meridianPoints = [self getPointsForMeridian:MERIDIAN];
    
    self.title = @"Meridiano della Milza";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(DEMONavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Indietro" style:UIBarButtonItemStylePlain target:self action:@selector(chiudiMi)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
