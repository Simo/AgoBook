//
//  EAPTavolePuntiCommonViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 24/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPTavolePuntiCommonViewController.h"
#import "EAPAppDelegate.h"
#import "EAPAcuPointButton.h"
#import "DEMONavigationController.h"

#define VOCEMENUDX @"Meridiani"
#define VOCEMENUSX @"Indietro"


@interface EAPTavolePuntiCommonViewController ()

@end

@implementation EAPTavolePuntiCommonViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    if(!_acupoints){
        [self getAcupoints];
    }
    
    self.meridianPoints = [self getPointsForMeridian:self.meridian];
    self.title = self.titoloNavBar;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:VOCEMENUDX
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(DEMONavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:VOCEMENUSX style:UIBarButtonItemStylePlain target:self action:@selector(chiudiMi)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) getAcupoints
{
    _acupoints = [(EAPAppDelegate *)[[UIApplication sharedApplication] delegate] acupoints];
}

- (NSArray *)getPointsForMeridian:(NSString *)meridian
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"meridian like %@",meridian];
    NSArray *array = [NSArray arrayWithArray:[self.acupoints filteredArrayUsingPredicate:predicate]];
    NSArray *sortDescriptors = [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"num" ascending:YES]];
    NSArray *secondArray = [NSArray arrayWithArray:[array sortedArrayUsingDescriptors:sortDescriptors]];
    return secondArray;
}

- (AcuPoint *) getAcupointWithName:(NSString *)name inArray:(NSArray *)array
{
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name like %@",name];
    NSLog(@"nome dell'acupoint: %@",name);
    NSLog(@"array d'acupoint: %@",array);
    return (AcuPoint *)[[array filteredArrayUsingPredicate:predicate] objectAtIndex:0];
}

- (void) selezionatoPunto:(AcuPoint *)punto fromController:(EAPTavolePuntiCommonViewController *)controller
{
    [self.delegate selezionatoAcupoint:punto perPunto:self.punto fromController:controller];
}

-(IBAction)selezionatoAcupoint:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    AcuPoint *ap = (AcuPoint *)[self getAcupointWithName:btn.titleLabel.text inArray:self.meridianPoints];
    NSLog(@"selezionato un acupoint: %@",ap);
    [self.delegate selezionatoAcupoint:ap perPunto:nil fromController:self];
}

- (void) chiudiMi
{
    NSLog(@"dismetto: %@", self);
    [self dismissViewControllerAnimated:NO completion:nil];
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
