//
//  EsameObiettivo.h
//  AgoBook
//
//  Created by Simone Bierti on 14/06/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Allegato, Trattamento;

@interface EsameObiettivo : NSManagedObject

@property (nonatomic, retain) NSString * evidenze;
@property (nonatomic, retain) NSSet *allegati;
@property (nonatomic, retain) Trattamento *trattamento;
@end

@interface EsameObiettivo (CoreDataGeneratedAccessors)

- (void)addAllegatiObject:(Allegato *)value;
- (void)removeAllegatiObject:(Allegato *)value;
- (void)addAllegati:(NSSet *)values;
- (void)removeAllegati:(NSSet *)values;

@end
