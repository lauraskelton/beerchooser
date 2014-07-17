//
//  BeerDetailViewController.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailViewController.h"
#import "BeerRatingView.h"

@interface BeerDetailViewController () <RatingDelegate>

@property (nonatomic, weak) IBOutlet UILabel *beerNameLabel;
@property (nonatomic, weak) IBOutlet UILabel *breweryLabel;
@property (nonatomic, weak) IBOutlet BeerRatingView *ratingView;

@property (nonatomic, retain) NSString *beerName;
@property (nonatomic, retain) NSString *brewery;
@property (nonatomic, retain) NSNumber *predictedRating;
@property (nonatomic, retain) NSNumber *userRating;
@property (nonatomic, retain) NSNumber *beerID;

@end

@implementation BeerDetailViewController
@synthesize beerName = _beerName, brewery = _brewery, predictedRating = _predictedRating, userRating = _userRating, beerID = _beerID;

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.beerNameLabel.text = _beerName;
    self.breweryLabel.text = _brewery;
    [self.ratingView ratingViewIsSmall:NO predictedRating:_predictedRating userRating:_userRating];
    //[self.ratingView setBeerPredictedRating:_predictedRating andBeerUserRating:_userRating];

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

- (void)setBeerName:(NSString *)beerName
{
    _beerName = beerName;
}

- (void)setBrewery:(NSString *)brewery
{
    _brewery = brewery;
}

- (void)setPredictedRating:(NSNumber *)predictedRating andUserRating:(NSNumber *)userRating
{
    _predictedRating = predictedRating;
    _userRating = userRating;
}

- (void)setBeerID:(NSNumber *)beerID
{
    _beerID = beerID;
}

- (void)finishedUpdatingRating
{
    // cancel rating loading view
}

#pragma mark - Rating View Delegate

- (void)ratingView:(RatingView *)ratingView didChangeUserRatingFrom:(NSInteger)previousUserRating
				to:(NSInteger)userRating
{
    [self.eventHandler saveRating:@(userRating) forBeer:self.beerID];
}


@end
