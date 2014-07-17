//
//  BeerDetailModuleDelegateInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/17/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

// This protocol becomes the way by which something else can hear back about what happened inside of this module
@protocol BeerDetailModuleDelegate <NSObject>

- (void)beerDetailModuleDidCancelView;
- (void)beerDetailModuleDidSaveRating;

@end
