//
//  BeerDisplayData.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseBeersDisplayData.h"


@interface BrowseBeersDisplayData()
@property (nonatomic, copy) NSArray*    sections;
@end


@implementation BrowseBeersDisplayData

+ (instancetype)browseBeersDisplayDataWithSections:(NSArray *)sections
{
    BrowseBeersDisplayData* data = [[BrowseBeersDisplayData alloc] init];
    
    data.sections = sections;
    
    return data;
}


- (BOOL)isEqualToBrowseBeersDisplayData:(BrowseBeersDisplayData *)data
{
    if (!data)
    {
        return NO;
    }
    
    BOOL hasEqualSections = [self.sections isEqualToArray:data.sections];
    
    return hasEqualSections;
}


- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[BrowseBeersDisplayData class]])
    {
        return NO;
    }
    
    return [self isEqualToBrowseBeersDisplayData:object];
}


- (NSUInteger)hash
{
    return [self.sections hash];
}

@end
