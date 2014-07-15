//
//  BeerTableViewCell.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerTableViewCell.h"
#import "BeerRatingView.h"

@implementation BeerTableViewCell
@synthesize beerTitleLabel,breweryLabel,ratingView;

- (void)awakeFromNib
{
    // Initialization code
    [self.ratingView ratingViewIsSmall:YES predictedRating:@(2) userRating:@(2)];
}

-(void)setPredictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating
{
    [self.ratingView ratingViewIsSmall:YES predictedRating:beerPredictedRating userRating:beerUserRating];
}

@end