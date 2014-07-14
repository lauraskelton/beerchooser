//
//  ManagedBeer.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface ManagedBeer : NSManagedObject

@property (nonatomic, retain) NSNumber * beerID;
@property (nonatomic, retain) NSString * beerDescription;
@property (nonatomic, retain) NSString * styleName;
@property (nonatomic, retain) NSString * brewery;
@property (nonatomic, retain) NSNumber * predictedRating;
@property (nonatomic, retain) NSNumber * userRating;
@property (nonatomic, retain) NSString * beerName;
@property (nonatomic, retain) NSDate * rateDate;
@property (nonatomic, retain) NSString * imgURL;
@property (nonatomic, retain) NSNumber * toDrinkIndex;

@end
