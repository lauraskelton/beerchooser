//
//  PageType.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "PageTypes.h"

@implementation PageTypes

- (id)init {
    return [self initWithBundle:NSBundle.mainBundle];
}

- (id)initWithBundle:(NSBundle *)bundle {
    self = [super init];
    if (!self) return nil;
    
    NSString *plistPath = [bundle pathForResource:@"PageTypes" ofType:@"plist"];
    if (plistPath == nil) {
        [NSException raise:@"FileNotFoundException" format:@"No PageTypes.plist file was found."];
    }
    self.pagesArray = [[NSArray alloc] initWithContentsOfFile:plistPath];
    
    return self;
}

@end
