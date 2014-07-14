//
//  BeerDisplayData.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrowseBeersDisplayData : NSObject

@property (nonatomic, readonly, copy,) NSArray*    sections;   // array of BrowseBeersDisplaySection

+ (instancetype)browseBeersDisplayDataWithSections:(NSArray *)sections;

@end
