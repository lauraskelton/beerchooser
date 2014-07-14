//
//  BeerChooserAPIManager.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BeerChooserAPINetworkDelegateInterface.h"

@class BeerChooserAPIDataManager;

@interface BeerChooserAPINetwork : NSObject

@property (nonatomic, weak) id <BeerChooserAPINetworkDelegate> apiNetworkDelegate;
@property (nonatomic, strong) BeerChooserAPIDataManager *apiDataManager;

+ (BeerChooserAPINetwork *)shared;

-(void)login;
-(void)getBeersToDrink;

@end
