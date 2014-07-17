//
//  BeerDetailRatingCell.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeerRatingView;

@interface BeerDetailRatingCell : UITableViewCell

@property (nonatomic, weak) IBOutlet BeerRatingView *ratingView;

-(void)setPredictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating;

@end
