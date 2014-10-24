//
//  EASideBarViewController.h
//  ElenaAgo
//
//  Created by Simone Bierti on 31/10/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EAPSideBarViewController;
@class Persona;

@protocol EAPSideBarViewControllerDelegate
@optional
- (void) willLoadAnagraficaViewController:(EAPSideBarViewController *)controller;
- (void) willLoadRespectiveViewController:(EAPSideBarViewController *)controller indexPath:(NSIndexPath *)indexPath;
@end

@interface EAPSideBarViewController : UITableViewController  <UITableViewDelegate>

@property (weak, nonatomic) IBOutlet id <EAPSideBarViewControllerDelegate> delegate2;

@property (strong, nonatomic) Persona *personaScelta;

@property (strong, nonatomic) IBOutlet UITableViewCell *ultimoTrattamento;

@end
