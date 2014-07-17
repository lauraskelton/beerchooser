//
//  BeerDisplayDataCollector.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseBeersDisplayDataCollector.h"
#import "BrowseBeer.h"
#import "BrowseBeersDisplayData.h"
#import "BrowseBeersDisplaySection.h"
#import "BrowseBeersDisplayItem.h"
#import "NSArray+POBJ.h"


@interface BrowseBeersDisplayDataCollector()

@property (nonatomic, strong)   NSMutableDictionary*    sections;

@end


@implementation BrowseBeersDisplayDataCollector

- (void)addBrowseBeers:(NSArray *)browseBeers
{
    for (BrowseBeer *browseBeer in browseBeers)
    {
        [self addBrowseBeer:browseBeer];
    }
}

- (void)addBrowseBeer:(BrowseBeer *)browseBeer
{
    BrowseBeersDisplayItem *displayItem = [self displayItemForBrowseBeer:browseBeer];
    [self addDisplayItem:displayItem];
}


- (BrowseBeersDisplayItem *)displayItemForBrowseBeer:(BrowseBeer *)browseBeer
{
    return [BrowseBeersDisplayItem browseBeersDisplayItemWithName:browseBeer.beerName brewery:browseBeer.brewery userRating:browseBeer.userRating predictedRating:browseBeer.predictedRating beerID:browseBeer.beerID];
}

- (void)addDisplayItem:(BrowseBeersDisplayItem *)displayItem
{
    NSMutableArray *sectionItems = [self sectionItems];
    [sectionItems addObject:displayItem];
}

- (NSMutableArray *)sectionItems
{
    NSMutableDictionary *sections = self.sections;
    NSMutableArray *section = sections[@"main"];
    
    if (section == nil)
    {
        section = [NSMutableArray array];
        sections[@"main"] = section;
    }
    
    return section;
}

- (BrowseBeersDisplayData *)collectedDisplayData
{
    NSArray *displaySections = [[self collectedSectionKeys] arrayFromObjectsCollectedWithBlock:^id(NSNumber *sectionKey) {
        return [self displaySectionForKey:sectionKey];
    }];
    
    return [BrowseBeersDisplayData browseBeersDisplayDataWithSections:displaySections];
}


- (NSArray *)collectedSectionKeys
{
    return [[self.sections allKeys] sortedArrayUsingSelector:@selector(compare:)];
}


- (BrowseBeersDisplaySection *)displaySectionForKey:(NSNumber *)sectionKey
{
    NSString *sectionTitle = self.sectionTitle;
    NSString *imageName = [self sectionImageName];
    
    return [BrowseBeersDisplaySection browseBeersDisplaySectionWithName:sectionTitle
                                                           imageName:imageName
                                                               items:self.sections[sectionKey]];
}


- (NSString *)sectionImageName
{
    return @"check";
}

- (NSMutableDictionary *)sections
{
    if (_sections == nil)
    {
        _sections = [NSMutableDictionary dictionary];
    }
    
    return _sections;
}

@end