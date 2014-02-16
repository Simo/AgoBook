//
//  EAPStoriaEmotivaViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPStoriaEmotivaViewController;

@protocol EAPStoriaEmotivaViewControllerDelegate

-(void) populateStoriaEmotivaFields:(EAPStoriaEmotivaViewController *) controller;
-(void) changeStoriaEmotivaFields:(EAPStoriaEmotivaViewController *) controller;

@end

@interface EAPStoriaEmotivaViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) id <EAPStoriaEmotivaViewControllerDelegate> delegate;

@property (strong, nonatomic) IBOutlet UITextField *txtFieldAutoDescrizione;
@property (strong, nonatomic) IBOutlet UIScrollView *scrollView;
@end
