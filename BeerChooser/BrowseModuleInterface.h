//
//  BrowseModuleInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeersDisplayItem;

@protocol BrowseModuleInterface <NSObject>

- (void)updateView;
- (void)showDetailViewWithDisplayItem:(BrowseBeersDisplayItem *)displayItem;

@end
