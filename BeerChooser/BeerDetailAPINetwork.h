//
//  BeerDetailAPINetwork.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeerDetailAPINetworkDelegateInterface.h"

@class BeerDetailAPIDataManager, BaseAPINetwork;

@interface BeerDetailAPINetwork : NSObject

@property (nonatomic, weak) id <BeerDetailAPINetworkDelegate> apiNetworkDelegate;
@property (nonatomic, strong) BeerDetailAPIDataManager *apiDataManager;
@property (nonatomic, strong) BaseAPINetwork *baseAPINetwork;

- (void)updateRating:(NSNumber *)newUserRating forBeerWithID:(NSNumber *)beerID;

@end
