//
//  BeerCollectionViewCell.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerCollectionViewCell.h"
#import "BeerRatingView.h"
#import <QuartzCore/QuartzCore.h>

@implementation BeerCollectionViewCell
@synthesize beerTitleLabel,breweryLabel,ratingView,beerLabelImageView;

- (void)awakeFromNib
{
    // Initialization code
    self.layer.borderWidth=1.0f;
    self.layer.borderColor=[UIColor lightGrayColor].CGColor;
    
    [self.ratingView ratingViewIsSmall:YES predictedRating:@(2) userRating:@(2)];
}

-(void)setPredictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating
{
    [self.ratingView ratingViewIsSmall:YES predictedRating:beerPredictedRating userRating:beerUserRating];
}

@end
