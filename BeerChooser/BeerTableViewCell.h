//
//  BeerTableViewCell.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeerRatingView;

@interface BeerTableViewCell : UITableViewCell

@property (nonatomic, weak) IBOutlet UILabel *beerTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *breweryLabel;
@property (nonatomic, weak) IBOutlet BeerRatingView *ratingView;

-(void)setPredictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating;

@end
