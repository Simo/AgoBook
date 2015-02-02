//
//  Feedback.h
//  AgoBook
//
//  Created by Simone Bierti on 02/02/15.
//  Copyright (c) 2015 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Seduta;

@interface Feedback : NSManagedObject

@property (nonatomic, retain) NSString * sensazioni;
@property (nonatomic, retain) NSString * annotazioni;
@property (nonatomic, retain) NSNumber * soddisfazione;
@property (nonatomic, retain) NSString * percezionePrima;
@property (nonatomic, retain) NSString * percezioneDopo;
@property (nonatomic, retain) Seduta *seduta;

@end
