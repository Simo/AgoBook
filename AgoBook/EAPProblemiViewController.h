//
//  EAPProblemiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPContainedCommonViewController.h"
#import "Trattamento.h"
#import "Anamnesi.h"
#import "EsameObiettivo.h"
#import "Diagnosi.h"
#import "JVFloatLabeledTextView.h"

@class EAPProblemiViewController;

@protocol EAPProblemiViewControllerDelegate <NSObject>


-(void)apriNuovaSedutaViewController:(EAPProblemiViewController *)controller;

@end

@interface EAPProblemiViewController : EAPContainedCommonViewController <UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) id<EAPProblemiViewControllerDelegate> delegate;

@property (weak, nonatomic) Trattamento *trattamento;
/*
@property (strong, nonatomic) EsameObiettivo *esameObiettivo;
@property (strong, nonatomic) Diagnosi *diagnosi;
@property (strong, nonatomic) Anamnesi *anamnesi;
*/
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextView *manifestazioneTextView;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextView *sintomiTextView;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextView *evidenzeTextView;
@property (strong, nonatomic) IBOutlet JVFloatLabeledTextView *descrizioneTextView;



- (IBAction)takePhoto:  (UIButton *)sender;

@end
