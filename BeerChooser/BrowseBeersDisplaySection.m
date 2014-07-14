//
//  BeerDisplaySection.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseBeersDisplaySection.h"


@interface BrowseBeersDisplaySection()

@property (nonatomic, copy) NSString*   name;
@property (nonatomic, copy) NSString*   imageName;
@property (nonatomic, copy) NSArray*    items;

@end


@implementation BrowseBeersDisplaySection

+ (instancetype)browseBeersDisplaySectionWithName:(NSString *)name
                                     imageName:(NSString *)imageName
                                         items:(NSArray *)items
{
    BrowseBeersDisplaySection *section = [[BrowseBeersDisplaySection alloc] init];
    
    section.name = name;
    section.imageName = imageName;
    section.items = items;
    
    return section;
}


- (BOOL)isEqualToBrowseBeersDisplaySection:(BrowseBeersDisplaySection *)section
{
    if (!section)
    {
        return NO;
    }
    
    BOOL hasEqualNames = [self.name isEqualToString:section.name];
    BOOL hasEqualImageNames = [self.imageName isEqualToString:section.imageName];
    BOOL hasEqualItems = [self.items isEqualToArray:section.items];
    
    return hasEqualNames && hasEqualImageNames && hasEqualItems;
}


- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[BrowseBeersDisplaySection class]])
    {
        return NO;
    }
    
    return [self isEqualToBrowseBeersDisplaySection:object];
}


- (NSUInteger)hash
{
    return [self.name hash] ^ [self.imageName hash] ^ [self.items hash];
}

@end