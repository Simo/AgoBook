//
//  EAPProblemiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPProblemiViewController;

@protocol EAPProblemiViewControllerDelegate <NSObject>

-(void)apriNuovaSedutaViewController:(EAPProblemiViewController *)controller;

@end

@interface EAPProblemiViewController : UIViewController <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (weak,nonatomic) id<EAPProblemiViewControllerDelegate> delegate;

- (IBAction)takePhoto:  (UIButton *)sender;

@end
