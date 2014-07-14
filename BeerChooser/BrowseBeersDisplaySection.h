//
//  BeerDisplaySection.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface BrowseBeersDisplaySection : NSObject
@property (nonatomic, readonly, copy)   NSString*   name;
@property (nonatomic, readonly, copy)   NSString*   imageName;
@property (nonatomic, readonly, copy)   NSArray*    items;  // array of BrowseBeersDisplayItem

+ (instancetype)browseBeersDisplaySectionWithName:(NSString *)name
                                     imageName:(NSString *)imageName
                                         items:(NSArray *)items;

@end
