//
//  EAPProblemiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Anamnesi.h"

@class EAPProblemiViewController;

@protocol EAPProblemiViewControllerDelegate <NSObject>

-(void)apriNuovaSedutaViewController:(EAPProblemiViewController *)controller;

@end

@interface EAPProblemiViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) id<EAPProblemiViewControllerDelegate> delegate;

@property (weak, nonatomic) EsameObiettivo *esameObiettivo;
@property (weak, nonatomic) Diagnosi *diagnosi;
@property (weak, nonatomic) Anamnesi *anamnesi;

- (IBAction)takePhoto:  (UIButton *)sender;

@end
