//
//  BrowseInteractor.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowseInteractor.h"
#import "BrowseDataManager.h"
#import "Beer.h"
#import "BrowseBeer.h"
#import "NSArray+POBJ.h"
#import "BeerChooserAPINetwork.h"

@interface BrowseInteractor()

@property (nonatomic, strong)   BrowseDataManager *dataManager;
@property (nonatomic, strong)   BeerChooserAPINetwork *apiNetwork;

- (void)findDownloadedBrowseBeers;

@end


@implementation BrowseInteractor

- (instancetype)initWithDataManager:(BrowseDataManager *)dataManager andAPINetwork:(BeerChooserAPINetwork *)apiNetwork
{
    if ((self = [super init]))
    {
        _dataManager = dataManager;
        _apiNetwork = apiNetwork;
    }
    
    return self;
}

-(void)findBrowseBeers
{
    // tell api network to download beers
    // Should this dependency be set up like others?
    [_apiNetwork getBeersToDrink];
}

- (void)findDownloadedBrowseBeers
{
    __weak typeof(self) welf = self;
    
    [self.dataManager browseBeersWithCompletionBlock:^(NSArray *beers) {
        [welf.output foundBeers:[welf browseBeersFromBeers:beers]];
    }];
}


- (NSArray *)browseBeersFromBeers:(NSArray *)beers
{
    NSArray *validBeers = (beers != nil) ? beers : @[];
    
    return [validBeers arrayFromObjectsCollectedWithBlock:^id(Beer *aBeer) {
        
        return [BrowseBeer browseBeerWithName:aBeer.beerName brewery:aBeer.brewery userRating:aBeer.userRating predictedRating:aBeer.predictedRating];
    }];
}

#pragma mark - BeerChooser API Network Delegate

- (void)beerChooserAPIError
{
    // handle API error
    NSLog(@"API Error");
}

- (void)beerChooserAPIGotData
{
    // tell presenter to update view with new data
    NSLog(@"API got data");
    [self findDownloadedBrowseBeers];
}

@end