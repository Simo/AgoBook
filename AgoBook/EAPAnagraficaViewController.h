//
//  EAPAnagraficaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPContainedCommonViewController.h"

@class EAPAnagraficaViewController;

@protocol EAPAnagraficaViewControllerDelegate

@end

@interface EAPAnagraficaViewController : EAPContainedCommonViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UILabel *lblProva;
@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@property (weak, nonatomic) IBOutlet UITextField *txtCognome;
@property (strong, nonatomic) IBOutlet UIButton *btnVerifica;
@property (weak, nonatomic) IBOutlet UILabel *lblPersonaNome;

@property (weak, nonatomic) id <EAPAnagraficaViewControllerDelegate> delegate;

-(IBAction)btnPressed:(id)sender;

@end
