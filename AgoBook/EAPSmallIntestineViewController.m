//
//  EAPSmallIntestineViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/11/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPSmallIntestineViewController.h"
#import "DEMONavigationController.h"

#define MERIDIAN @"SI"
#define TITOLONAVBAR @"Meridiano dell'Intestino Tenue"

@interface EAPSmallIntestineViewController ()

@end

@implementation EAPSmallIntestineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.meridianPoints = [self getPointsForMeridian:MERIDIAN];
    self.title = TITOLONAVBAR;
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
