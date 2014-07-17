//
//  BrowseBeer.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrowseBeer : NSObject
@property (nonatomic, readonly, strong) NSString*                 beerName;
@property (nonatomic, readonly, copy)   NSString*               brewery;
@property (nonatomic, readonly, copy)   NSNumber*               userRating;
@property (nonatomic, readonly, copy)   NSNumber*               predictedRating;
@property (nonatomic, readonly, copy)   NSNumber*               beerID;

+ (instancetype)browseBeerWithName:(NSString *)beerName
                           brewery:(NSString *)brewery
                        userRating:(NSNumber *)userRating
                   predictedRating:(NSNumber *)predictedRating
                            beerID:(NSNumber *)beerID;

@end