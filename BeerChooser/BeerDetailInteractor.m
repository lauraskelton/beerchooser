//
//  BeerDetailInteractor.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/17/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailInteractor.h"

#import "BeerDetailDataManager.h"
#import "BeerDetailAPINetwork.h"
#import "BrowseBeer.h"

@interface BeerDetailInteractor()

@property (nonatomic, strong)   BeerDetailDataManager *dataManager;
@property (nonatomic, strong)   BeerDetailAPINetwork *apiNetwork;

@end

@implementation BeerDetailInteractor

- (instancetype)initWithDataManager:(BeerDetailDataManager *)dataManager andAPINetwork:(BeerDetailAPINetwork *)apiNetwork
{
    if ((self = [super init]))
    {
        _dataManager = dataManager;
        _apiNetwork = apiNetwork;
    }
    
    return self;
}

#pragma mark - BeerDetailInteractor Input

- (void)updateRating:(NSNumber *)newUserRating forBeerWithID:(NSNumber *)beerID;
{
    [_apiNetwork updateRating:newUserRating forBeerWithID:beerID];
}

- (UIImage *)findImageWithBrowseBeer:(BrowseBeer *)browseBeer
{
    return [_apiNetwork getImageForBeer:browseBeer];
}

#pragma mark - Beer Detail API Network Delegate

- (void)beerDetailAPIError
{
    // handle API error
    NSLog(@"API Error");
    [self.output finishedUpdatingRating];
}

- (void)beerDetailAPIUpdatedRating
{
    // tell presenter to update view
    NSLog(@"API got data");
    [self.output finishedUpdatingRating];
}

- (void)beerDetailAPIGotImage:(UIImage *)image forBrowseBeer:(BrowseBeer *)browseBeer
{
    // tell presenter to update view with new image
    NSLog(@"API got image");
    [self.output foundImage:image forBrowseBeer:browseBeer];
}

@end

