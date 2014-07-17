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


#pragma mark - Browse Module Interface

- (void)updateView
{
    [self.browseInteractor findBrowseBeers];
}

- (void)showDetailViewWithDisplayItem:(BrowseBeersDisplayItem *)displayItem
{
    // present beer detail view with this item data
    [self.browseWireframe presentBeerDetailInterfaceWithDisplayItem:displayItem];
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
    collector.sectionTitle = self.sectionTitle;
    [collector addBrowseBeers:beers];
    
    return [collector collectedDisplayData];
}

#pragma mark - Beer Detail Module Delegate

- (void)beerDetailModuleDidCancelView
{
    // No action necessary
}

- (void)beerDetailModuleDidSaveRating
{
    // No action necessary
}

@end