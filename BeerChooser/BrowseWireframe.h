//
//  BrowseWireframe.h
//  BeerChooser
//
//  Created by Laura Skelton on 7/10/14.
//  Copyright (c) 2014 Laura Skelton. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BrowsePresenter, BrowseViewController, BeerDetailWireframe, BrowseBeer;

@interface BrowseWireframe : NSObject

@property (nonatomic, strong) BeerDetailWireframe *beerDetailWireframe;
@property (nonatomic, strong) BrowsePresenter *browsePresenter;
@property (nonatomic, retain) NSString *pageTitle;

-(UIViewController *)createBrowseNavigationController;
- (void)presentBeerDetailInterfaceWithBrowseBeer:(BrowseBeer *)browseBeer;

@end
