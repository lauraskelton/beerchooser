//
//  BrowseModuleInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeer;

@protocol BrowseModuleInterface <NSObject>

- (void)updateView;
- (void)showDetailViewWithBrowseBeer:(BrowseBeer *)browseBeer;
- (UIImage *)findImageWithBrowseBeer:(BrowseBeer *)browseBeer;

@end
