//
//  BrowseInteractorIO.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BeerCollectionViewCell, BrowseBeer;

@protocol BrowseInteractorInput <NSObject>
- (void)findBrowseBeers;
- (UIImage *)findImageWithBrowseBeer:(BrowseBeer *)browseBeer;
@end


@protocol BrowseInteractorOutput <NSObject>

- (void)foundBeers:(NSArray *)beers;
- (void)foundImage:(UIImage *)image forBrowseBeer:(BrowseBeer *)browseBeer;

@end
