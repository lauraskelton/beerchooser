//
//  Beer.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Beer : NSObject

@property (nonatomic, copy) NSNumber * beerID;
@property (nonatomic, copy) NSString * beerDescription;
@property (nonatomic, copy) NSString * styleName;
@property (nonatomic, copy) NSString * beerName;
@property (nonatomic, copy) NSString * brewery;
@property (nonatomic, copy) NSString * imgURL;
@property (nonatomic, copy) NSDate * rateDate;
@property (nonatomic, copy) NSNumber * predictedRating;
@property (nonatomic, copy) NSNumber * userRating;
@property (nonatomic, copy) NSNumber * toDrinkIndex;

+ (instancetype)beerWithName:(NSString*)beerName description:(NSString*)beerDescription brewery:(NSString *)brewery predictedRating:(NSNumber *)predictedRating userRating:(NSNumber *)userRating styleName:(NSString *)styleName id:(NSNumber *)beerID rateDate:(NSDate *)rateDate imgURL:(NSString *)imgURL toDrinkIndex:(NSNumber *)toDrinkIndex;

@end
