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

#import "BrowseBeer.h"

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

- (UIImage *)findImageWithBrowseBeer:(BrowseBeer *)browseBeer
{
    // tell API to download item then update this cell's imageview if it's still displaying the same beer
    return [self.beerDetailInteractor findImageWithBrowseBeer:browseBeer];
}

- (void)configureUserInterfaceForPresentation:(id<BeerDetailViewInterface>)beerDetailViewUserInterface withBrowseBeer:(BrowseBeer *)browseBeer
{
    [beerDetailViewUserInterface setBrowseBeer:browseBeer];

}

#pragma mark - BeerDetailInteractor Output
- (void)finishedUpdatingRating
{
    [self.userInterface finishedUpdatingRating];
}

- (void)foundImage:(UIImage *)image forBrowseBeer:(BrowseBeer *)browseBeer
{
    [self.userInterface browseBeer:browseBeer foundImage:image];
}

@end