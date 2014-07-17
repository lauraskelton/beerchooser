//
//  BeerDetailPresenter.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailPresenter.h"

#import "BeerDetailInteractor.h"
#import "BeerDetailViewInterface.h"
#import "BeerDetailWireframe.h"

#import "BrowseBeersDisplayItem.h"

@implementation BeerDetailPresenter

- (void)cancelView
{
    [self.beerDetailWireframe dismissBeerDetailInterface];
    [self.beerDetailModuleDelegate beerDetailModuleDidCancelView];
}


- (void)saveRating:(NSNumber *)rating forBeer:(NSNumber *)beerID
{
    [self.beerDetailInteractor updateRating:rating forBeerWithID:beerID];
    [self.beerDetailModuleDelegate beerDetailModuleDidSaveRating];
}


- (void)configureUserInterfaceForPresentation:(id<BeerDetailViewInterface>)beerDetailViewUserInterface withDisplayItem:(BrowseBeersDisplayItem *)displayItem
{
    [beerDetailViewUserInterface setBeerName:displayItem.beerName];
    [beerDetailViewUserInterface setBrewery:displayItem.brewery];
    [beerDetailViewUserInterface setPredictedRating:displayItem.predictedRating andUserRating:displayItem.userRating];
    [beerDetailViewUserInterface setBeerID:displayItem.beerID];

}

#pragma mark - BeerDetailInteractor Output
- (void)finishedUpdatingRating
{
    [self.userInterface finishedUpdatingRating];
}

@end
