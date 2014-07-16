//
//  BeerChooserAPIDataManager.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "BeerChooserAPIDataManager.h"

#import "ManagedBeer.h"
#import "CoreDataStore.h"
#import "Beer.h"

@implementation BeerChooserAPIDataManager

- (void)addNewBeer:(Beer *)aBeer
{
    ManagedBeer *newBeer = [self.dataStore newBeerWithUniqueID:aBeer.beerID];
    
    newBeer.beerID = aBeer.beerID;
    newBeer.beerName = aBeer.beerName;
    newBeer.beerDescription = aBeer.beerDescription;
    newBeer.styleName = aBeer.styleName;
    newBeer.brewery = aBeer.brewery;
    newBeer.predictedRating = aBeer.predictedRating;
    newBeer.userRating = aBeer.userRating;
    newBeer.rateDate = aBeer.rateDate;
    newBeer.imgURL = aBeer.imgURL;
    [newBeer setValue:aBeer.index forKey:self.indexString];
    
    [self.dataStore save];
}

@end