//
//  EAPPuntiSedutaTableViewController.m
//  AgoBook
//
//  Created by Simone Bierti on 15/02/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "EAPPuntiSedutaTableViewController.h"

#define kSecondsForCompleteUpdate   3.0
#define kUpdateInterval             0.02

@interface EAPPuntiSedutaTableViewController ()

@property (strong, nonatomic) IBOutlet UIProgressView *progressView;
@property (strong, nonatomic) IBOutlet UIButton *avviaProgress;
@property (strong, nonatomic) IBOutlet UITextField *txtFieldPunto;
@property (strong, nonatomic) NSTimer *timer;

@end

@implementation EAPPuntiSedutaTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startProgressTapped
{
    self.progressView.progress = 0.0;
    
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
    }
    else
    {
        [self.timer invalidate];
        
        self.avviaProgress.enabled = YES;
    }
}


@end
