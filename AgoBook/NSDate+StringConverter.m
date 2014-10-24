//
//  NSDate+StringConverter.m
//  AgoBook
//
//  Created by Simone Bierti on 06/10/14.
//  Copyright (c) 2014 Simone Bierti. All rights reserved.
//

#import "NSDate+StringConverter.h"

@implementation NSDate (StringConverter)

- (NSString *) stringFromDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *stringDate = [dateFormatter stringFromDate:self];
    return stringDate;
}

@end
