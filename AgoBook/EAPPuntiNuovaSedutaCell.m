//
//  EAPPuntiNuovaSedutaCell.m
//  AgoBook
//
//  Created by Simone Bierti on 24/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPuntiNuovaSedutaCell.h"
#import "Punto.h"

#define kSecondsForCompleteUpdate   1680.0 // 28 minuti per terminare la seduta
#define kUpdateInterval             1.0

@interface EAPPuntiNuovaSedutaCell()

@property (strong, nonatomic) IBOutlet UILabel *lblTempoAppl;
@property (nonatomic) NSInteger secondsPassed;
@end

@implementation EAPPuntiNuovaSedutaCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)startProgressTapped
{
    self.progressView.progress = 0.0;
    self.secondsPassed = 0;
    
    self.avviaProgress.enabled = NO;
    
    self.timer = [NSTimer timerWithTimeInterval:kUpdateInterval
                                         target:self
                                       selector:@selector(updateProgressView)
                                       userInfo:nil
                                        repeats:YES];
    
    [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
    [self.timer fire];
}

#pragma mark - Private Methods

- (void)updateProgressView;
{
    if (self.progressView.progress < 1.0)
    {
        self.progressView.progress += (kUpdateInterval / kSecondsForCompleteUpdate);
        self.secondsPassed += kUpdateInterval;
        int minutes = self.secondsPassed / 60;
        int seconds = self.secondsPassed % 60;
        
        NSString *time = [NSString stringWithFormat:@"%d:%02d", minutes, seconds];
        self.lblTempoAppl.text = time;
    }
    else
    {
        [self.timer invalidate];
        
        self.avviaProgress.enabled = YES;
    }
}

-(void)textFieldDidEndEditing:(UITextField *)textField{
    self.punto.punto = self.txtFieldPunto.text;
}

@end
