//
//  EAPPopOverPazientiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 14/08/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPPatientsTableViewController.h"

@class EAPPopOverPazientiViewController;

@protocol EAPPPopOverPazientiViewControllerDelegate <NSObject>

-(void) openPersonaDiary:(Persona *)persona fromController:(EAPPopOverPazientiViewController *)controller;
-(void) aggiungiNuovaPersona:(EAPPopOverPazientiViewController *) controller;
-(void) pazientiPopoverDidFinish:(EAPPopOverPazientiViewController *) controller;

@end


@interface EAPPopOverPazientiViewController : UIViewController <EAPPatientsTableViewControllerDelegate>

@property (weak, nonatomic) id<EAPPPopOverPazientiViewControllerDelegate> delegateAddresser;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) EAPPatientsTableViewController *patientsController;


-(IBAction)done:(id)sender;

@end
