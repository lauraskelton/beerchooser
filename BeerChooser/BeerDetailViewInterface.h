//
//  BeerDetailViewInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BeerDetailViewInterface <NSObject>

- (void)setBeerName:(NSString *)beerName;
- (void)setBrewery:(NSString *)brewery;
- (void)setPredictedRating:(NSNumber *)predictedRating andUserRating:(NSNumber *)userRating;
- (void)setBeerID:(NSNumber *)beerID;
- (void)finishedUpdatingRating;

@end
