//
//  BrowsePresenter.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BrowsePresenter.h"

#import "BrowseInteractor.h"
#import "BrowseViewInterface.h"
#import "BrowseWireframe.h"
#import "BrowseBeersDisplayDataCollector.h"


@implementation BrowsePresenter

- (void)updateView
{
    [self.browseInteractor findBrowseBeers];
}


#pragma mark - Browse Interactor Output

- (void)foundBeers:(NSArray *)beers
{
    if ([beers count] == 0)
    {
        [self.userInterface showNoContentMessage];
    }
    else
    {
        [self updateUserInterfaceWithBeers:beers];
    }
}


- (void)updateUserInterfaceWithBeers:(NSArray *)beers
{
    [self.userInterface showBrowseBeersDisplayData:[self browseBeersDisplayDataWithItems:beers]];
}


- (BrowseBeersDisplayData *)browseBeersDisplayDataWithItems:(NSArray *)beers
{
    BrowseBeersDisplayDataCollector *collector = [[BrowseBeersDisplayDataCollector alloc] init];
    [collector addBrowseBeers:beers];
    
    return [collector collectedDisplayData];
}

@end