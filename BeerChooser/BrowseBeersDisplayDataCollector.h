//
//  BeerDisplayDataCollector.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowseBeersDisplayData;


@interface BrowseBeersDisplayDataCollector : NSObject

@property (nonatomic, retain) NSString *sectionTitle;

- (void)addBrowseBeers:(NSArray *)browseBeers;
- (BrowseBeersDisplayData*)collectedDisplayData;

@end