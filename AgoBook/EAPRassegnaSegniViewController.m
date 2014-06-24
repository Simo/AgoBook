//
//  EAPRassegnaSegniViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import "EAPRassegnaSegniViewController.h"

@interface EAPRassegnaSegniViewController ()

@property (strong, nonatomic) NSMutableArray *tokens;
@property (strong, nonatomic) NSMutableArray *tokens3;

@end

@implementation EAPRassegnaSegniViewController

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
    NSArray *tmp = [[NSArray alloc] initWithObjects:@"Primo",@"Secondo token",@"il terzo token non si dimentica mai", nil];
    self.tokens = [NSMutableArray arrayWithArray:tmp];
    self.view2 = [[SBRTTokenView alloc] initWithFrame:CGRectMake(20, 900, 500, 150)];
    [self.view2 setDelegate:self];
    [self.view2 refreshTokenView:self.tokens];

    self.tokens3 = [NSMutableArray arrayWithArray:tmp];
    self.view3 = [[SBRTTokenView alloc] initWithFrame:CGRectMake(20, 100, 500, 150)];
    [self.view3 setDelegate:self];
    [self.view3 refreshTokenView:self.tokens3];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    if([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    } else if ([string isEqualToString:@","]){
        [textField resignFirstResponder];
        return NO;
    }
    
    return YES;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    if(textField.tag == 100){
        [self.tokens addObject:textField.text];
        [self.view2 refreshTokenView:self.tokens];
        textField.text = @"";
        textField.placeholder = @"placeholder3";
        
    } else if (textField.tag == 101){
        [self.tokens3 addObject:textField.text];
        [self.view3 refreshTokenView:self.tokens3];
        textField.text = @"";
        textField.placeholder = @"placeholder2";
    }
    
}

-(void)addMeToSubviews:(SBRTTokenView *)view {
    if(![[self.scrollView subviews] containsObject:view]){
        NSLog(@"aggiungo la subview");
        [self.scrollView addSubview:view];
    }
}

@end
