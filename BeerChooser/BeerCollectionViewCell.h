//
//  BeerCollectionViewCell.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/28/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BeerRatingView;

@interface BeerCollectionViewCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UILabel *beerTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel *breweryLabel;
@property (nonatomic, weak) IBOutlet UIImageView *beerLabelImageView;
@property (nonatomic, weak) IBOutlet BeerRatingView *ratingView;

-(void)setPredictedRating:(NSNumber *)beerPredictedRating userRating:(NSNumber *)beerUserRating;

@end
