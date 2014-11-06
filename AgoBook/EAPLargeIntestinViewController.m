//
//  EAPLargeIntestinViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 25/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPLargeIntestinViewController.h"
#import "DEMONavigationController.h"

#define MERIDIAN @"LI"

@interface EAPLargeIntestinViewController ()

@end

@implementation EAPLargeIntestinViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.myPoints = [self getPointsForMeridian:MERIDIAN];
    self.meridianPoints = [self getPointsForMeridian:MERIDIAN];
    
    self.title = @"Meridiano del Grosso Intestino";
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
