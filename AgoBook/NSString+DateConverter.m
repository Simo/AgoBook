//
//  NSString+NSString_DateConverter.m
//  AgoBook
//
//  Created by Simone Bierti on 06/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "NSString+DateConverter.h"

@implementation NSString (DateConverter)

- (NSDate *) dateFromString
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSDate *dateFromString = [[NSDate alloc] init];
    dateFromString = [dateFormatter dateFromString:self];
    return dateFromString;
}

@end
