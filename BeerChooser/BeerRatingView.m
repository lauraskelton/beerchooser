//
//  BeerRatingView.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerRatingView.h"

@interface BeerRatingView (/* Private methods */)

- (void)setSmallBeerImages;
- (void)setLargeBeerImages;

@end

@implementation BeerRatingView

-(void)ratingViewIsSmall:(BOOL)viewIsSmall predictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating
{
    if (viewIsSmall) {
        [self setSmallBeerImages];
    } else {
        [self setLargeBeerImages];
    }
    
    // configure user and predicted rating numbers
    if (([beerUserRating integerValue]>=1) && ([beerUserRating integerValue]<=5)) {
        self.rating = [beerPredictedRating integerValue];
        [self initialSetUserRating:[beerUserRating integerValue]];
    }
    else{
        if ([beerPredictedRating integerValue]==0) {
            self.rating = 0;
            [self unsetUserRating];
        }
        else {
            self.rating = [beerPredictedRating integerValue];
            [self unsetUserRating];
        }
    }
}

- (void)setSmallBeerImages
{
	
	[self setBeerImage:[UIImage imageNamed:@"small-beer-nonselected.png"]
              forState:kRatingViewNonSelected];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-selected.png"]
              forState:kRatingViewSelected];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-halfselected.png"]
              forState:kRatingViewHalfSelected];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-1qselected.png"]
              forState:kRatingViewQuarterSelected];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-3qselected.png"]
              forState:kRatingViewThreeQuarterSelected];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-hot.png"]
              forState:kRatingViewHot];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-highlighted.png"]
              forState:kRatingViewHighlighted];
	[self setBeerImage:[UIImage imageNamed:@"small-beer-userselected.png"]
              forState:kRatingViewUserSelected];
	
	self.userInteractionEnabled = NO;
}

- (void)setLargeBeerImages
{
	
	[self setBeerImage:[UIImage imageNamed:@"beer-halfselected.png"]
              forState:kRatingViewHalfSelected];
	[self setBeerImage:[UIImage imageNamed:@"beer-1qselected.png"]
              forState:kRatingViewQuarterSelected];
	[self setBeerImage:[UIImage imageNamed:@"beer-3qselected.png"]
              forState:kRatingViewThreeQuarterSelected];
	[self setBeerImage:[UIImage imageNamed:@"beer-highlighted.png"]
              forState:kRatingViewHighlighted];
	[self setBeerImage:[UIImage imageNamed:@"beer-hot.png"]
              forState:kRatingViewHot];
	[self setBeerImage:[UIImage imageNamed:@"beer-nonselected.png"]
              forState:kRatingViewNonSelected];
	[self setBeerImage:[UIImage imageNamed:@"beer-selected.png"]
              forState:kRatingViewSelected];
	[self setBeerImage:[UIImage imageNamed:@"beer-userselected.png"]
              forState:kRatingViewUserSelected];
	
	self.userInteractionEnabled = YES;
}

@end
