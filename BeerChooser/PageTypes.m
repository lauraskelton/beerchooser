//
//  PageTypes.m
//  BeerChooser
//
//  Created by Laura Skelton on 7/15/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import "PageTypes.h"

@implementation PageTypes

+ (NSString *)pageTitleForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return @"BEERCHOOSER";
            break;
        case PAGE_POPULAR:
            return @"BEERCHOOSER";
            break;
        case PAGE_RATINGS:
            return @"BEERCHOOSER";
            break;
        case PAGE_SUGGESTIONS:
            return @"BEERCHOOSER";
            break;
            
        default:
            break;
    }
}

+ (NSString *)sectionTitleForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return @"Nearby Beers";
            break;
        case PAGE_POPULAR:
            return @"Popular Beers";
            break;
        case PAGE_RATINGS:
            return @"Your Ratings";
            break;
        case PAGE_SUGGESTIONS:
            return @"Beers to Try";
            break;
            
        default:
            break;
    }
}

+ (NSString *)tabTitleForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return @"Nearby";
            break;
        case PAGE_POPULAR:
            return @"Popular";
            break;
        case PAGE_RATINGS:
            return @"Ratings";
            break;
        case PAGE_SUGGESTIONS:
            return @"To Try";
            break;
            
        default:
            break;
    }
}

+ (UIImage *)tabImageForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return [UIImage imageNamed:@"first"];
            break;
        case PAGE_POPULAR:
            return [UIImage imageNamed:@"second"];
            break;
        case PAGE_RATINGS:
            return [UIImage imageNamed:@"first"];
            break;
        case PAGE_SUGGESTIONS:
            return [UIImage imageNamed:@"second"];
            break;
            
        default:
            break;
    }
}

+ (NSString *)apiLinkForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return @"iosbeerstodrink.php";
            break;
        case PAGE_POPULAR:
            return @"iosbeerstodrink.php";
            break;
        case PAGE_RATINGS:
            return @"iosbeerstodrink.php";
            break;
        case PAGE_SUGGESTIONS:
            return @"iosbeerstodrink.php";
            break;
            
        default:
            break;
    }
}

+ (NSString *)indexNameForType:(PageType)pageType
{
    switch (pageType) {
        case PAGE_NEARBY:
            return @"toDrinkIndex";
            break;
        case PAGE_POPULAR:
            return @"toDrinkIndex";
            break;
        case PAGE_RATINGS:
            return @"toDrinkIndex";
            break;
        case PAGE_SUGGESTIONS:
            return @"toDrinkIndex";
            break;
            
        default:
            break;
    }
}

@end
