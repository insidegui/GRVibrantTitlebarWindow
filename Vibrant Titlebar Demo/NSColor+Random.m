//
//  NSColor+Random.m
//  Visual Experiments
//
//  Created by iCloud Tester on 23/08/14.
//  Copyright (c) 2014 Guilherme Rambo. All rights reserved.
//

#import "NSColor+Random.h"

@implementation NSColor (Random)

+ (NSColor *)gr_randomColor
{
    CGFloat red =  (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat blue = (CGFloat)random()/(CGFloat)RAND_MAX;
    CGFloat green = (CGFloat)random()/(CGFloat)RAND_MAX;
    
    return [NSColor colorWithCalibratedRed:red green:green blue:blue alpha:1.0];
}

@end
