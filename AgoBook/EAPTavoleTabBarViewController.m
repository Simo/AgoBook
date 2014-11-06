//
//  EAPTavoleTabBarViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 25/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPTavoleTabBarViewController.h"
#import "EAPLungViewController.h"
#import "EAPLargeIntestinViewController.h"

@interface EAPTavoleTabBarViewController ()

@property (strong, nonatomic) EAPLungViewController *lungVC;
@property (strong, nonatomic) EAPLargeIntestinViewController *liVC;

@end

@implementation EAPTavoleTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSLog(@"%@", [[self viewControllers] objectAtIndex:0]);
    self.lungVC = (EAPLungViewController *)[[self viewControllers] objectAtIndex:0];
    self.lungVC.delegate = self;
    self.liVC = (EAPLargeIntestinViewController *)[[self viewControllers] objectAtIndex:1];
    self.liVC.delegate = self;
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

- (void)selezionatoAcupoint:(AcuPoint *)acupoint perPunto:(Punto *)punto fromController:(EAPTavolePuntiCommonViewController *)controller
{
    NSLog(@"%@",acupoint);
    [self.delegateVC selectedAcupoint:acupoint fromController:self];
}


@end
