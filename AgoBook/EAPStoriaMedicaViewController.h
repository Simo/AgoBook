//
//  EAPStoriaMedicaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPContainedCommonViewController.h"

@class StoriaMedica;
@class EAPStoriaMedicaViewController;

@protocol EAPStoriaMedicaViewControllerDelegate <NSObject>

-(void)populateStroriaMedicaFields:(EAPStoriaMedicaViewController *)controller;
-(void)changeStoriaMedicaFields:(EAPStoriaMedicaViewController *)controller;

@end

@interface EAPStoriaMedicaViewController : EAPContainedCommonViewController <UITextViewDelegate>

@property (weak, nonatomic) id <EAPStoriaMedicaViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@property (strong, nonatomic) IBOutlet UITextView *interventiTextView;
@property (strong, nonatomic) IBOutlet UITextView *incidentiTextView;
@property (strong, nonatomic) IBOutlet UITextView *ricoveriTextView;
@property (strong, nonatomic) IBOutlet UITextView *partiColpiteTextView;
@property (strong, nonatomic) IBOutlet UITextView *effettiCollateraliTextView;
@property (strong, nonatomic) IBOutlet UITextView *storiaMFamigliaTextView;

@end
