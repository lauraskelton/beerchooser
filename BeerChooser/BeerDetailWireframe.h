//
//  BeerDetailWireframe.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/16/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BeerDetailPresenter, BrowseBeersDisplayItem;

@interface BeerDetailWireframe : NSObject

@property (nonatomic, strong) BeerDetailPresenter *beerDetailPresenter;

- (void)presentBeerDetailInterfaceFromNavigationController:(UINavigationController *)navigationController withDisplayItem:(BrowseBeersDisplayItem *)displayItem;
- (void)dismissBeerDetailInterface;

@end
