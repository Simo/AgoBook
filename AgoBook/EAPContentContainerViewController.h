//
//  EAPContentContainerViewController.h
//  AgoBook
//
//  Created by Simone Bierti on 03/12/13.
//  Copyright (c) 2013 Simone Bierti. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EAPAnagraficaViewController.h"
#import "EAPStoriaMedicaViewController.h"
#import "EAPStoriaEmotivaViewController.h"
#import "EAPRassegnaSegniViewController.h"
#import "EAPTrattamentiViewController.h"
#import "EAPNuovaSedutaViewController.h"
#import "EAPRassSegniPersonaleViewController.h"

@class EAPContentContainerViewController;
@class Persona;

@protocol EAPContentContainerViewControllerDelegate <NSObject>

- (void) modifyTitleBarWithString:(NSString *)testo;

@end

@interface EAPContentContainerViewController : UIViewController <EAPAnagraficaViewControllerDelegate, EAPStoriaMedicaViewControllerDelegate ,EAPStoriaEmotivaViewControllerDelegate, EAPRassSegniPersonaleViewControllerDelegate, EAPTrattamentiViewControllerDelegate>

@property (weak, nonatomic) Persona *persona;

@property (weak, nonatomic) id<EAPContentContainerViewControllerDelegate> delegate;

@property (strong, nonatomic) EAPAnagraficaViewController *anagraficaVC;
@property (strong, nonatomic) EAPStoriaMedicaViewController *storiaMedicaVC;
@property (strong, nonatomic) EAPStoriaEmotivaViewController *storiaEmotivaVC;
@property (strong, nonatomic) EAPRassSegniPersonaleViewController *rassegnaSegniVC;
@property (strong, nonatomic) EAPTrattamentiViewController *trattamentiVC;
@property (strong, nonatomic) EAPNuovaSedutaViewController *nuovaSedutaVC;

@property (strong, nonatomic) UIViewController *currentViewController;
@property (strong, nonatomic) NSMutableDictionary *relativePositions;

-(void)willLoadContentViewFromMenu:(NSString *)nomeContentView;
-(void)populateAnagraficaViewFields:(EAPAnagraficaViewController *)controller;
-(void)changeAnagraficaFields:(EAPAnagraficaViewController *)controller;

@end
