//
//  PageTypes.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//



#import <Foundation/Foundation.h>

#import "PageTypeDef.h"

@interface PageTypes : NSObject

+ (NSString *)pageTitleForType:(PageType)pageType;
+ (NSString *)sectionTitleForType:(PageType)pageType;
+ (NSString *)tabTitleForType:(PageType)pageType;
+ (UIImage *)tabImageForType:(PageType)pageType;
+ (NSString *)apiLinkForType:(PageType)pageType;
+ (NSString *)indexNameForType:(PageType)pageType;

@end
