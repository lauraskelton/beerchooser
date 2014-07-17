//
//  BeerChooserAPIManager.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BrowseAPINetworkDelegateInterface.h"

@class BrowseAPIDataManager, BaseAPINetwork;

@interface BrowseAPINetwork : NSObject

@property (nonatomic, weak) id <BrowseAPINetworkDelegate> apiNetworkDelegate;
@property (nonatomic, strong) BrowseAPIDataManager *apiDataManager;
@property (nonatomic, strong) BaseAPINetwork *baseAPINetwork;
@property (nonatomic, retain) NSString *apiLink;

-(void)getBeersToDrink;

@end
