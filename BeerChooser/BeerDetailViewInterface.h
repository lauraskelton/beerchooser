//
//  BeerDetailViewInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeer;

@protocol BeerDetailViewInterface <NSObject>

- (void)setBrowseBeer:(BrowseBeer *)browseBeer;
- (void)finishedUpdatingRating;
- (void)browseBeer:(BrowseBeer *)browseBeer foundImage:(UIImage *)image;

@end
