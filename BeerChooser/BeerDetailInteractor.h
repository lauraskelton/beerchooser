//
//  BeerDetailInteractor.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/17/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeerDetailAPINetworkDelegateInterface.h"
#import "BeerDetailInteractorIO.h"

@class BeerDetailDataManager, BeerDetailAPINetwork;

@interface BeerDetailInteractor : NSObject <BeerDetailInteractorInput, BeerDetailAPINetworkDelegate>

@property (nonatomic, weak)     id<BeerDetailInteractorOutput> output;

- (instancetype)initWithDataManager:(BeerDetailDataManager *)dataManager andAPINetwork:(BeerDetailAPINetwork *)apiNetwork;

@end
