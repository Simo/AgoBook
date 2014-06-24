//
//  StoriaEmotiva.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Persona;

@interface StoriaEmotiva : NSManagedObject

@property (nonatomic, retain) NSString * autoDescrizione;
@property (nonatomic, retain) NSString * colorePref;
@property (nonatomic, retain) NSString * cosaNonPiace;
@property (nonatomic, retain) NSString * oraMigliore;
@property (nonatomic, retain) NSString * oraPeggiore;
@property (nonatomic, retain) NSString * saporePref;
@property (nonatomic, retain) NSString * stagioneOdiata;
@property (nonatomic, retain) NSString * stagionePref;
@property (nonatomic, retain) NSString * storiaPersonale;
@property (nonatomic, retain) Persona *persona;

@end
