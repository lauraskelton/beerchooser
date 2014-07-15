//
//  BeerRatingView.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "RatingView.h"

@interface BeerRatingView : RatingView {
	
}

-(void)ratingViewIsSmall:(BOOL)viewIsSmall predictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating;

@end
