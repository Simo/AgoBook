//
//  EAPListaTrattamentiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CoreDataTableViewController.h"

@class EAPListaTrattamentiViewController;

@protocol EAPListaTrattamentiViewControllerDelegate

-(void) listaTrattamentiRowSelected:(EAPListaTrattamentiViewController *)controller withIndexPath:(NSIndexPath *)indexPath;

@end

@interface EAPListaTrattamentiViewController : CoreDataTableViewController <UIActionSheetDelegate>

@property (strong, nonatomic) UIActionSheet *clearConfirmActionSheet;
@property (strong,nonatomic) NSArray *listaTrattamenti;

@property (weak, nonatomic) id<EAPListaTrattamentiViewControllerDelegate> behaviorDelegate;

@end
