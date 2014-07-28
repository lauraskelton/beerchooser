//
//  BeerChooserAPINetworkInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/14/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeer;

// This protocol becomes the way by which something else can hear back about what happened inside of this module
@protocol BrowseAPINetworkDelegate <NSObject>

- (void)browseAPIError;
- (void)browseAPIGotData;
- (void)browseAPIGotImage:(UIImage *)image forBrowseBeer:(BrowseBeer *)browseBeer;

@end