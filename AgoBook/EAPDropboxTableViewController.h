//
//  EAPDropboxTableViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 19/09/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Dropbox/Dropbox.h>
#import "EAPAppDelegate.h"
#import "CoreDataHelper.h"
#import "DropboxHelper.h"

@interface EAPDropboxTableViewController : UITableViewController <UIAlertViewDelegate, UIActionSheetDelegate>

@property (strong, nonatomic) NSMutableArray *contents;
@property (assign, nonatomic) BOOL loading;

@property (strong, nonatomic) UIActionSheet *options;
@property (strong, nonatomic) UIAlertView *confirmRestore;
@property (strong, nonatomic) NSString *selectedZipFileName;

- (IBAction)backup:(id)sender;

@end
