//
//  EAPPuntiNuovaSedutaCell.h
//  AgoBook
//
//  Created by Simone Bierti on 24/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Punto;

@interface EAPPuntiNuovaSedutaCell : UITableViewCell <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIButton *avviaProgress;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldPunto;
@property (strong, nonatomic) IBOutlet UILabel *lblTempoAppl;
@property (strong, nonatomic) NSTimer *timer;

@property (strong, nonatomic) Punto *punto;

-(IBAction)startProgressTapped:(id)sender;

@end
