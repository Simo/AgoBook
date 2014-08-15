//
//  EAPStoriaEmotivaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPContainedCommonViewController.h"

@class EAPStoriaEmotivaViewController;

@protocol EAPStoriaEmotivaViewControllerDelegate

-(void) populateStoriaEmotivaFields:(EAPStoriaEmotivaViewController *) controller;
-(void) changeStoriaEmotivaFields:(EAPStoriaEmotivaViewController *) controller;

@end

@interface EAPStoriaEmotivaViewController : EAPContainedCommonViewController <UITextFieldDelegate,UITextViewDelegate>

@property (weak, nonatomic) id <EAPStoriaEmotivaViewControllerDelegate> delegate;


@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;

@property (strong, nonatomic) IBOutlet UITextView *autodescrizioneTextView;
@property (strong, nonatomic) IBOutlet UITextView *storiaPersonaleTextView;
@property (strong, nonatomic) IBOutlet UITextView *cosaNonPiaceTextView;

@property (strong, nonatomic) IBOutlet UITextField *colorePreferitoTextField;
@property (strong, nonatomic) IBOutlet UITextField *coloreInvisoTextField;
@property (strong, nonatomic) IBOutlet UITextField *stagionePreferitaTextField;
@property (strong, nonatomic) IBOutlet UITextField *stagioneInvisaTextField;
@property (strong, nonatomic) IBOutlet UITextField *oraPreferitaTextField;
@property (strong, nonatomic) IBOutlet UITextField *oraInvisaTextField;
@property (strong, nonatomic) IBOutlet UITextField *saporePreferitoTextField;
@property (strong, nonatomic) IBOutlet UITextField *saporeInvisoTextField;


@end
