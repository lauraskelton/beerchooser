//
//  Beer.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "Beer.h"

@implementation Beer

+ (instancetype)beerWithName:(NSString*)beerName description:(NSString*)beerDescription brewery:(NSString *)brewery predictedRating:(NSNumber *)predictedRating userRating:(NSNumber *)userRating styleName:(NSString *)styleName id:(NSNumber *)beerID rateDate:(NSDate *)rateDate imgURL:(NSString *)imgURL index:(NSNumber *)index
{
    Beer *aBeer = [[self alloc] init];
    
    aBeer.beerID = beerID;
    aBeer.beerName = beerName;
    aBeer.beerDescription = beerDescription;
    aBeer.brewery = brewery;
    aBeer.predictedRating = predictedRating;
    aBeer.userRating = userRating;
    aBeer.styleName = styleName;
    aBeer.rateDate = rateDate;
    aBeer.imgURL = imgURL;
    aBeer.index = index;
    
    return aBeer;
}

@end