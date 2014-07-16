//
//  BrowseViewInterface.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeersDisplayData;


// Defines the public interface that something else can use to drive the user interface
@protocol BrowseViewInterface <NSObject>

- (void)showNoContentMessage;
- (void)showBrowseBeersDisplayData:(BrowseBeersDisplayData *)data;
- (void)reloadEntries;

-(void)printTitle;

@end
