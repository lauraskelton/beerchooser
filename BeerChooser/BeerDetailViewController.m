//
//  BeerDetailViewController.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailViewController.h"
#import "BeerRatingView.h"
#import "BrowseBeer.h"

@interface BeerDetailViewController () <RatingDelegate>

@property (nonatomic, weak) IBOutlet UILabel *beerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *breweryLabel;
@property (nonatomic, weak) IBOutlet BeerRatingView *ratingView;
@property (nonatomic, weak) IBOutlet UIImageView *beerLabelImageView;

@property (nonatomic, retain) BrowseBeer *browseBeer;

@end

@implementation BeerDetailViewController
@synthesize browseBeer = _browseBeer;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.beerNameLabel.text = _browseBeer.beerName;
    self.breweryLabel.text = _browseBeer.brewery;
    [self.ratingView ratingViewIsSmall:NO predictedRating:_browseBeer.predictedRating userRating:_browseBeer.userRating];
    
    self.beerLabelImageView.image = [self.eventHandler findImageWithBrowseBeer:_browseBeer];

}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.ratingView.delegate = self;
    
}

- (IBAction)cancel:(id)sender
{
    [self.eventHandler cancelView];
}

#pragma mark - BeerDetailViewInterface

- (void)setBrowseBeer:(BrowseBeer *)browseBeer
{
    _browseBeer = browseBeer;
}

- (void)finishedUpdatingRating
{
    // cancel rating loading view
}

- (void)browseBeer:(BrowseBeer *)browseBeer foundImage:(UIImage *)image
{
    if ([browseBeer isEqual:_browseBeer]) {
        // this beer is currently visible
        self.beerLabelImageView.image = image;
    }
    // we don't need to do anything if the beer is not visible
}

#pragma mark - Rating View Delegate

- (void)ratingView:(RatingView *)ratingView didChangeUserRatingFrom:(NSInteger)previousUserRating
				to:(NSInteger)userRating
{
    [self.eventHandler saveRating:@(userRating) forBeer:_browseBeer.beerID];
}


@end
