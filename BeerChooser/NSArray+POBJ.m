//
//  NSArray+POBJ.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "NSArray+POBJ.h"

@implementation NSArray (POBJ)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block
{
    __block NSMutableArray *collection = [NSMutableArray arrayWithCapacity:[self count]];
    
    [self enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        [collection addObject:block(obj)];
    }];
    
    return collection;
}

@end
