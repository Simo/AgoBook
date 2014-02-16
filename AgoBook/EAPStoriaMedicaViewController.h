//
//  EAPStoriaMedicaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class StoriaMedica;
@class EAPStoriaMedicaViewController;

@protocol EAPStoriaMedicaViewControllerDelegate <NSObject>

-(void)populateStroriaMedicaFields:(EAPStoriaMedicaViewController *)controller;
-(void)changeStoriaMedicaFields:(EAPStoriaMedicaViewController *)controller;

@end

@interface EAPStoriaMedicaViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <EAPStoriaMedicaViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UITextView *incidentiTxtView;

@end
