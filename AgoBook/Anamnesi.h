//
//  Anamnesi.h
//  AgoBook
//
//  Created by Simone Bierti on 10/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Trattamento;

@interface Anamnesi : NSManagedObject

@property (nonatomic, retain) NSString * manifestazione;
@property (nonatomic, retain) NSString * sintomi;
@property (nonatomic, retain) Trattamento *trattamento;

@end
