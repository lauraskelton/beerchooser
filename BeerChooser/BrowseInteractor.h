//
//  BrowseInteractor.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrowseInteractorIO.h"
#import "BrowseAPINetworkDelegateInterface.h"

@class      BrowseDataManager, BrowseAPINetwork;

@interface BrowseInteractor : NSObject <BrowseInteractorInput, BrowseAPINetworkDelegate>

@property (nonatomic, weak)     id<BrowseInteractorOutput> output;

- (instancetype)initWithDataManager:(BrowseDataManager *)dataManager andAPINetwork:(BrowseAPINetwork *)apiNetwork;

@end
