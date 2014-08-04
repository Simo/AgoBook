//
//  EAPRassSegniPersonaleViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 15/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "CoreDataTableViewController.h"
#import "EAPSegnoPersonaleTableViewCell.h"
#import "Persona.h"

@class EAPRassSegniPersonaleViewController;

@protocol EAPRassSegniPersonaleViewControllerDelegate <NSObject>

-(void) populateRassegnaSegniFields:(EAPRassSegniPersonaleViewController *) controller;
-(void) changeRassegnaSegniFields:(EAPRassSegniPersonaleViewController *) controller;

@end

@interface EAPRassSegniPersonaleViewController : CoreDataTableViewController <UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate,EAPSegnoPersonaleTableViewCellDelegate>

@property (weak,nonatomic) id<EAPRassSegniPersonaleViewControllerDelegate> delegate;
@property (strong,nonatomic) Persona *selectedPersona;
@property (strong, nonatomic) NSManagedObjectID *selectedPersonId;
@property (strong, nonatomic) NSFetchedResultsController *fetchedTags;
@property (strong, nonatomic) NSArray *fetchedSegni;


-(void)reloadDataOnTableView:(EAPSegnoPersonaleTableViewCell *)controller;

@end
