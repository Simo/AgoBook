//
//  EAPLungViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 24/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPLungViewController.h"
#import "EAPAppDelegate.h"
#import "DEMONavigationController.h"
#import "AcuPoint.h"
#import "EAPAcuPointButton.h"


#define MERIDIAN @"LU"

@interface EAPLungViewController ()

@property (nonatomic,strong) UILongPressGestureRecognizer *lpgr;

@end

@implementation EAPLungViewController

- (NSArray *) prepareButtons
{
    EAPAcuPointButton *btn1 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(398, 189, 34, 30) andLabel:@"LU-1"];
    EAPAcuPointButton *btn2 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(488, 152, 34, 30) andLabel:@"LU-2"];
    EAPAcuPointButton *btn3 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(375, 293, 34, 30) andLabel:@"LU-3"];
    EAPAcuPointButton *btn4 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(339, 311, 34, 30) andLabel:@"LU-4"];
    EAPAcuPointButton *btn5 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(269, 411, 34, 30) andLabel:@"LU-5"];
    EAPAcuPointButton *btn6 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(216, 465, 34, 30) andLabel:@"LU-6"];
    EAPAcuPointButton *btn7 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(161, 472, 34, 30) andLabel:@"LU-7"];
    EAPAcuPointButton *btn8 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(145, 500, 34, 30) andLabel:@"LU-8"];
    EAPAcuPointButton *btn9 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(124, 529, 34, 30) andLabel:@"LU-9"];
    EAPAcuPointButton *btn10 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(83, 545, 34, 30) andLabel:@"LU-10"];
    EAPAcuPointButton *btn11 = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(32, 551, 34, 30) andLabel:@"LU-11"];
    EAPAcuPointButton *btn5b = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(285, 355, 34, 30) andLabel:@"LU-5"];
    EAPAcuPointButton *btn11b = [[EAPAcuPointButton alloc] initWithFrame:CGRectMake(808, 500, 34, 30) andLabel:@"LU-11"];
    
    NSArray *array = [NSArray arrayWithObjects:btn1,btn2,btn3,btn4,btn5,btn6,btn7,btn8,btn9,btn10,btn10,btn11,btn5b,btn11b, nil];
    return array;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"Meridiano del Polmone";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Menu"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:(DEMONavigationController *)self.navigationController
                                                                            action:@selector(showMenu)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Indietro" style:UIBarButtonItemStylePlain target:self action:@selector(chiudiMi)];
    self.myPoints = [self getPointsForMeridian:MERIDIAN];
    self.meridianPoints = [self getPointsForMeridian:MERIDIAN];
    /*
    self.meridianButtons = [self prepareButtons];
    NSLog(@"l'array: %@",self.meridianButtons);
    
    for (EAPAcuPointButton *btn in self.meridianButtons) {
        NSLog(@"l'array: %@",btn.titleLabel.text);
        [self.view addSubview:btn];
    }
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(100, 100, 50, 50);
    button.titleLabel.text = @"eccoci";
    
    [self.view addSubview:button];
    */
    self.lpgr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(handleLongPressGestures:)];
    self.lpgr.minimumPressDuration = 1.0f;
    self.lpgr.allowableMovement = 100.0f;
    
    [self.view addGestureRecognizer:self.lpgr];

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

-(IBAction)callMeMaybe:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    AcuPoint *ap = (AcuPoint *)[self getAcupointWithName:btn.titleLabel.text inArray:self.meridianPoints];
    [self.delegate selezionatoAcupoint:ap perPunto:nil fromController:self];
}

- (void) chiudiMi
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)handleLongPressGestures:(UILongPressGestureRecognizer *)sender
{
    if ([sender isEqual:self.lpgr]) {
        if (sender.state == UIGestureRecognizerStateBegan)
        {
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Gestures" message:@"Long Gesture Detected" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alertView show];
        }
    }
}

@end
