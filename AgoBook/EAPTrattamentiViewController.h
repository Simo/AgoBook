//
//  EAPTrattamentiViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 04/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPListaTrattamentiViewController.h"
#import "EAPDettaglioContainerViewController.h"

@class Trattamento;
@class EAPTrattamentiViewController;

@protocol EAPTrattamentiViewControllerDelegate <NSObject>

-(void)apriNuovaSedutaViewController:(EAPTrattamentiViewController *)controller;

@end

@interface EAPTrattamentiViewController : UIViewController <EAPListaTrattamentiViewControllerDelegate, EAPDettaglioContainerViewControllerDelegate>

@property (strong, nonatomic) id<EAPTrattamentiViewControllerDelegate> delegate;

@property (strong, nonatomic) EAPListaTrattamentiViewController *listaTrattamentiVC;
@property (strong, nonatomic) EAPDettaglioContainerViewController *dettaglioTrattamentoVC;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segmDettaglioTrattamento;

@property (strong, nonatomic) Trattamento *trattamentoDesignato;
@property (strong, nonatomic) NSArray *array;

@property (strong, nonatomic) Persona *selectedPerson;

- (IBAction)segmentChanged:(UISegmentedControl *)sender;

@end
