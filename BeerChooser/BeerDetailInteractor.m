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
#import "Beer.h"

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

@end

