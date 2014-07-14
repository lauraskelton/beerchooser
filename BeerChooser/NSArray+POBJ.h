//
//  NSArray+POBJ.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (POBJ)

- (NSArray *)arrayFromObjectsCollectedWithBlock:(id(^)(id object))block;

@end
