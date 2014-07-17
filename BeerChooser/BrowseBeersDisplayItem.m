//
//  BeerDisplayItem.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseBeersDisplayItem.h"


@interface BrowseBeersDisplayItem()

@property (nonatomic, copy) NSString*   beerName;
@property (nonatomic, copy) NSString*   brewery;
@property (nonatomic, copy) NSNumber*   userRating;
@property (nonatomic, copy) NSNumber*   predictedRating;
@property (nonatomic, copy) NSNumber*   beerID;

@end


@implementation BrowseBeersDisplayItem

+ (instancetype)browseBeersDisplayItemWithName:(NSString *)beerName brewery:(NSString *)brewery userRating:(NSNumber *)userRating predictedRating:(NSNumber *)predictedRating beerID:(NSNumber *)beerID
{
    BrowseBeersDisplayItem *item = [[BrowseBeersDisplayItem alloc] init];
    
    item.beerName = beerName;
    item.brewery = brewery;
    item.userRating = userRating;
    item.predictedRating = predictedRating;
    item.beerID = beerID;
    
    return item;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@    %@ -- %@", [super description], self.beerName, self.brewery];
}


- (BOOL)isEqualToBrowseBeersDisplayItem:(BrowseBeersDisplayItem *)item
{
    if (!item)
    {
        return NO;
    }
    
    BOOL hasEqualNames = [self.beerName isEqualToString:item.beerName];
    BOOL hasEqualBreweries = [self.brewery isEqualToString:item.brewery];
    
    return hasEqualNames && hasEqualBreweries;
}


- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[BrowseBeersDisplayItem class]])
    {
        return NO;
    }
    
    return [self isEqualToBrowseBeersDisplayItem:object];
}


- (NSUInteger)hash
{
    return [self.beerName hash] ^ [self.brewery hash];
}

@end
