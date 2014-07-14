//
//  BeerDisplayItem.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrowseBeersDisplayItem : NSObject
@property (nonatomic, readonly, copy)   NSString*   beerName;
@property (nonatomic, readonly, copy)   NSString*   brewery;
@property (nonatomic, readonly, copy)   NSNumber*   numBeers;
@property (nonatomic, readonly, copy)   NSNumber*   isRated;

+ (instancetype)browseBeersDisplayItemWithName:(NSString *)beerName brewery:(NSString *)brewery numBeers:(NSNumber *)numBeers isRated:(NSNumber *)isRated;

@end