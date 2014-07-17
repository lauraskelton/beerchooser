//
//  BeerDetailInteractorIO.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/17/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol BeerDetailInteractorInput <NSObject>
- (void)updateRating:(NSNumber *)newUserRating forBeerWithID:(NSNumber *)beerID;
@end


@protocol BeerDetailInteractorOutput <NSObject>

- (void)finishedUpdatingRating;

@end
