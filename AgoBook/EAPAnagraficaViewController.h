//
//  EAPAnagraficaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPContainedCommonViewController.h"
#import "JVFloatLabeledTextField.h"
#import "JVFloatLabeledTextView.h"

@class EAPAnagraficaViewController;

@protocol EAPAnagraficaViewControllerDelegate
- (void) modifyTitleBarWithString:(NSString *)testo;
@end

@interface EAPAnagraficaViewController : EAPContainedCommonViewController <UITextFieldDelegate,UITextViewDelegate, UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UILabel *lblProva;
@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@property (weak, nonatomic) IBOutlet UITextField *txtCognome;
@property (strong, nonatomic) IBOutlet UIButton *btnVerifica;
@property (weak, nonatomic) IBOutlet UILabel *lblPersonaNome;
@property (strong, nonatomic) IBOutlet UITextView *textNucleo;
@property (strong, nonatomic) IBOutlet UITextView *textNucleoCommenti;

@property (strong, nonatomic) JVFloatLabeledTextField *nomeTextField;
@property (strong, nonatomic) JVFloatLabeledTextField *cognomeTextField;
@property (strong, nonatomic) JVFloatLabeledTextField *dataNascitaTextField;

@property (strong, nonatomic) JVFloatLabeledTextField *descrizioneLavoroTextField;
@property (strong, nonatomic) JVFloatLabeledTextField *localizzazioneLavoroTextField;
@property (strong, nonatomic) JVFloatLabeledTextField *soddisfazioneLavoroTextField;

@property (strong, nonatomic) JVFloatLabeledTextView *nucleoTextView;
@property (strong, nonatomic) JVFloatLabeledTextView *nucleoCommentiTextView;



@property (weak, nonatomic) id <EAPAnagraficaViewControllerDelegate> delegate;

- (IBAction)takePhoto:  (UIButton *)sender;
-(IBAction)btnPressed:(id)sender;

@end
