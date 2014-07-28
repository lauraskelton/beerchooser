//
//  BrowseBeer.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseBeer.h"


@interface BrowseBeer()

@property (nonatomic, strong) NSString*                 beerName;
@property (nonatomic, copy)   NSString*               brewery;
@property (nonatomic, copy)   NSString*               imgURL;
@property (nonatomic, copy)   NSNumber*               userRating;
@property (nonatomic, copy)   NSNumber*               predictedRating;
@property (nonatomic, copy)   NSNumber*               beerID;

@end


@implementation BrowseBeer

+ (instancetype)browseBeerWithName:(NSString *)beerName
                           brewery:(NSString *)brewery
                            imgURL:(NSString *)imgURL
                        userRating:(NSNumber *)userRating
                   predictedRating:(NSNumber *)predictedRating
                            beerID:(NSNumber *)beerID
{
    BrowseBeer *browseBeer = [[BrowseBeer alloc] init];
    
    browseBeer.beerName = beerName;
    browseBeer.brewery = brewery;
    browseBeer.imgURL = imgURL;
    browseBeer.userRating = userRating;
    browseBeer.predictedRating = predictedRating;
    browseBeer.beerID = beerID;
    
    return browseBeer;
}


- (NSString *)description
{
    return [NSString stringWithFormat:@"%@   %@  %@", [super description], self.beerName, self.brewery];
}


- (BOOL)isEqualToBrowseBeer:(BrowseBeer *)browseBeer
{
    if (!browseBeer)
    {
        return NO;
    }
    
    BOOL hasEqualNames = (!self.beerName && !browseBeer.beerName) || [self.beerName isEqualToString:browseBeer.beerName];
    BOOL hasEqualBreweries = (!self.brewery && !browseBeer.brewery) || [self.brewery isEqualToString:browseBeer.brewery];
    BOOL hasEqualBeerIDs = (!self.beerID && !browseBeer.beerID) || [self.beerID integerValue ]==[browseBeer.beerID integerValue];
    
    return hasEqualNames && hasEqualBreweries && hasEqualBeerIDs;
}


- (BOOL)isEqual:(id)object
{
    if (self == object)
    {
        return YES;
    }
    
    if (![object isKindOfClass:[BrowseBeer class]])
    {
        return NO;
    }
    
    return [self isEqualToBrowseBeer:object];
}


- (NSUInteger)hash
{
    return [self.beerName hash] ^ [self.brewery hash];
}

@end
