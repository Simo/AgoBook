//
//  Allegato.h
//  AgoBook
//
//  Created by Simone Bierti on 10/01/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class EsameObiettivo;

@interface Allegato : NSManagedObject

@property (nonatomic, retain) NSDate * dataInsert;
@property (nonatomic, retain) NSString * descrizione;
@property (nonatomic, retain) NSData * foto;
@property (nonatomic, retain) EsameObiettivo *esameObiettivo;

@end
