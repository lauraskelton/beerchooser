//
//  BeerDetailAPIDataManager.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerDetailAPIDataManager.h"

#import "ManagedBeer.h"
#import "CoreDataStore.h"

@implementation BeerDetailAPIDataManager

- (void)updateRating:(NSNumber *)newUserRating forBeerWithID:(NSNumber *)beerID
{
    // This Core Data method is set up to return an existing beer if one exists already
    // with that ID in the database. We are fetching the beer here, not creating it.
    ManagedBeer *updatedBeer = [self.dataStore newBeerWithUniqueID:beerID];
    
    updatedBeer.userRating = newUserRating;
    
    [self.dataStore save];
}

@end