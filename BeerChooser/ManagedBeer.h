//
//  ManagedBeer.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ManagedBeer : NSManagedObject

@property (nonatomic, retain) NSString * beerDescription;
@property (nonatomic, retain) NSNumber * beerID;
@property (nonatomic, retain) NSString * beerName;
@property (nonatomic, retain) NSString * brewery;
@property (nonatomic, retain) NSString * imgURL;
@property (nonatomic, retain) NSNumber * predictedRating;
@property (nonatomic, retain) NSDate * rateDate;
@property (nonatomic, retain) NSString * styleName;
@property (nonatomic, retain) NSNumber * toDrinkIndex;
@property (nonatomic, retain) NSNumber * userRating;
@property (nonatomic, retain) NSNumber * popularIndex;
@property (nonatomic, retain) NSNumber * ratingsIndex;
@property (nonatomic, retain) NSNumber * favoritesIndex;
@property (nonatomic, retain) NSNumber * wishlistIndex;

@end
